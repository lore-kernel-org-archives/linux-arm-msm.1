Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116533;
	b=jPP9QmcrhIMFdV2EYhTX6jSFr+43sBbRYttbk67tIRTZhi8kSfxl6nS/tbLJx+pY83MQ
	 wG/fsqu8vf2e8FREuxG0KHh9UHcfewhH2JQ/9ZsRZtxI34W3RTdew/CVYBcq6o2IUOxDw
	 JznWLgVjf6/NdRHpLEqYNe6AGM9+WmAOQU5GqMjkmU9et77/SZ9xpzHaDjp/DaAboKEXJ
	 Qlztvy4zm2fNxlyhb85pr1A5tggqQ7OlDSjZey7YFRwLbDvjZ3tVahw1rB+bvtuMMcnnS
	 +1czyQkxXqNuTe3zimLE5ryvkoIYoyfKRwf0DDjIZ+hG2Aswym3LZuGZoyzNNuAqpkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116533;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GSWYhomsqnrchx8poiEzdLXzCYm7bD+QXUY8UH2ekeY=;
	b=T1I8pQusIeYAURtlbAgcae4SWNrlgo16oDXc0W36U08bCuo4X9/8J2uPqn8KlGYIAhMu
	 Zirp80AZlFKMSQ/zvG/Cw31uzsYn0tePo8T6W21X1KUpPvjfXkb/mQBa4k2VnZpd3c9XW
	 kMFTd4ZsMnxoeS71efAVv/CpcVYQbKy8Nk8TTC0CVYA48FQpfcJGt0nqawa7ppDgXRehX
	 ON07VYeWBP69V+ufr7JlUEbaxpNvExeE/+4yI/StjKcllo/BfI1tl3GaJYIuo1cPcMI/j
	 9uI8jB37wJPFnotIISXgr2xh+5SDaUvu8UwnGUKp0d805fdUL5kI/YwiYsOYYcLVZ4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ifyqD/Jz";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JoP5WzMn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D21F606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D21F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ifyqD/Jz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JoP5WzMn
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFKvMI3655220
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GSWYhomsqnrchx8poiEzdLXzCYm7bD+QXUY8UH2ekeY=; b=ifyqD/Jz5Qg878rG
	wDdiMTJvQFZT5tsyzXWQsUoM2yM+9QbW1sU+klAmkdNTv1Dh8hvM8//OaUaVDDxV
	AZpAAz/jKyqluTrdcbkmWbhk/p95n+dsa5huSrAZv5IESjTVJTt11dLmJ4TxmVBp
	ZZGVJvhPwp+zRGdVYISB8C+RwWSp0bEoIwcnZ7PtTNTd1//M/cD0BYFe9iKt5kAu
	GHQ+n+d0GOmRwuxVsy8kCCiAQo+FZcbdzS2vJPSCWxj0t51jq2H4AMKLWwy5hZjW
	nwpEfmOEfuWVlmvEjYE+7mdfWUZeZcJK1iDzRHPLkP8b42eSCn3S7WjALEq5jbRH
	0Nds/A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91bc6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:55:31 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-988b6210181so2195241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793116530; x=1793721330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GSWYhomsqnrchx8poiEzdLXzCYm7bD+QXUY8UH2ekeY=;
        b=JoP5WzMn+6B8L3Pg6e8dFIxaC7tyE1nz2unP7C511FtHiJY0Qb8rlMAaEaHLc7wk+t
         lvB3Av51KHg7/mMJ4FfLCK9KKS8OHseD4kdTEr6kZqnVA9vmxyqMOGwYRipRrN2y1znX
         BSYCDGKojWR8cJlRX34tSwCQLO1bmHCuPX9UekwCEKtUSVKX50i/GY77lEseZIRtfPeg
         YYdGBpTxG7ticANCBbTPOQk5Q5zEWSFjdVfTDhDuItp5p8I9IoRdcs2ohs0iiWNqtuTm
         ag65U0OTFn7jR07feUf/hGi/I7SuIyV5ocGGZmaOBtnF3YkvFtz2lai+EvGbuFptiBNw
         kjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116530; x=1793721330;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GSWYhomsqnrchx8poiEzdLXzCYm7bD+QXUY8UH2ekeY=;
        b=I0alujPe5rM+5aF+ELacpiewWHus75AG5E7OUzRxFdhgMFDUYbY/NZuzryRJmDHMRY
         TfxQyIXsT1DfHOiZJLQnAVNEPaaxD7hZa8M3zwLPq0E63FEr7s4N7l9PXwgeKP3X8ALj
         8iY8MeidNjqhtPU3CxsjU1X8rOdahWBsFLup//HNXq0MaLu+y9+l8nYIZQlKoNbt3iQs
         J5lGqtyz0nA/gGd4QFFGj+sQjwHthVzN3Qpnq48Z/EFSyxZyNEBZeeWx5ZTw9LO1oAsf
         4L1EvWGyVrF56UsODfzROWytT1homAmnwShl4cg1yyuoHP0mA/gB6m+omAnT0wWNB1WQ
         LDEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwF9wZL0VdRGCvhtdzf2VeNCAh45497lnszuJ17pexvM7919RnwFAmW+dOf3UV34zlkLlQWZVObFARJGj/F@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0p9RRHdkNU1XTc+Xf1LeM9L/vMk80lQ4qvrYshNpXspYLvq5P
	xpmfmKxPQFdjS3yWWH543lODf6oKQh3dTAr6vVE7Jpehg99T9mkwi1uEMMXUYhUx1rLQ6r+CVA+
	/Rabo+E33DsKqFcvShJBCe+JnnxjIeWY2engHWYdWgmdPM6TODgJdKSVchs7HRsI7QnHY2wFadl
	PY
X-Gm-Gg: AYBFou01QkasFn/GylQQg3qiD4TVlkOCPXr04Chf8dEtUNOIO1PHTjNqpNetfYcnelG
	x+I/Wg6MpQHECIEhim94eE2bpJ+B+buWuDs3uMQWRzgk+NjDc8QByOvfhIpAQA6qdnW4X30Vv7Z
	I8Ul4IZc8Q8dLz+yy1utIkpk8NaaXXh6qS1s0QayFP9jDFc4OP116n0mKFDLYeb2sb6Yb0IytCB
	XYjhK0R0Dgo3RoxgP4LXemYA9NNlfMZtZCVWuSrzRtvby2yAG++zzHIKcTD3MnNgsddE0uvIC3E
	aTWdSq6BPuTPO3T/573ZrDDNan9iz9U2Y2lU5TDoYOLUL3IgqejFzzuYN8IXFyz20eBi4ixQFay
	kZ/5U/h7qf0iQzQInYe8bZw==
X-Received: by 2002:ac5:c8af:0:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5ec232688d9mr4623209e0c.3.1793116530109;
        Tue, 27 Oct 2026 08:55:30 -0700 (PDT)
X-Received: by 2002:ac5:c8af:0:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5ec232688d9mr4623179e0c.3.1793116529658;
        Tue, 27 Oct 2026 08:55:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66ca8asm483938666b.57.2026.10.27.08.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:55:28 -0700 (PDT)
Message-ID: <f165e4aa-e6d8-413d-abb0-c2e5045109f4@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 16:55:26 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add Mahua QCB
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
 <20261027114955.1266499-5-sivansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027114955.1266499-5-sivansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Zug8beIMTZF2aHC-g0c9qX3Ou1odC5uU
X-Proofpoint-GUID: Zug8beIMTZF2aHC-g0c9qX3Ou1odC5uU
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae0c973 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=q8tHnqZ0nZ31iGzolrYA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfXyVpo8TnANl7F
 AmMUBNGx8GU0p5gb1i/dfk3/iZe1+8z9rNU/VTqYCt/7TIVOyv91hLDS2OkYLKeKi3yw4ZVZ/ee
 3k2X5nlkLQreM09Ba4UqNgt+RR9AQdj57hT3y/A3Jrd1wTR05wbdwX3PF3BHjD956M7KMlHag9G
 wQz+BON5ZSzPIc4VileoW/bZCsfocSs3OgJeFlScK3QepXLO02j+bPn778WDChoYKsjG5h7DmAR
 7JnhMWRDI5AV4KSNasg9rnNnlKWVZV/6Eh544popNxBM8HEfWW1B+uj9aNPD/khHzn5ywgM6I1P
 aJLEt1SEMRgAs/435kOFqzYNXnUwOxiXvMkHzhiqacpC0jwB1y37hr0TUzSd8OCN6MrEf1K3bPY
 kcXKPXDPGOjrlGKp5YU0gMOt/vOJA1q0fMUHUWEoPaQMXeh1y0oTJarYA58lf5fgxBvPto37Eoq
 aT0f/IvDp0IOMjeOUGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfXwTJ5vWdMK9b+
 PTtFhM0y4HEjkCd+0ji833TB/uUtPgZeQrfZ1GwzwN+R5LFJXQy9Ed2ZiTn5KZavJwmeSgaHfO1
 h6MpAfZqlZnxVZlI4TG6LrN9M1BxN5A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270063

On 10/27/26 12:49 PM, Sivansh Gupta wrote:
> Add initial device tree support for Mahua QCB. Mahua QCB is a variant
> of Glymur QCB but using Mahua SoC instead of Glymur SoC.
> Mahua is a 12 core derivative of Glymur SoC.
> 
> Unlike the CRD, the QCB is suitable for compute workloads, power
> measurements and oscilloscope-based hardware validation.
> 
> Includes glymur-qcb.dtsi, adds Mahua QCB specific board compatible,
> adds tcsr regulator-supply properties, removed cluster2 PMIC/thermal
> nodes.
> 
> Co-developed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
