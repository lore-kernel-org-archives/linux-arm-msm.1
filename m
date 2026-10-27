Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793115285;
	b=NXClwxuX15DVa3XekOVY6WU40X7TZtMH6Rw2xdwjIwYI8GatQnV9ujyyLaYal25mOw8N
	 EyxHN4K0brUzMUz86brOnDMrakuZBzLINH8THgJUawkud+PbznwI1TGR5BvDzc0FXSxa5
	 F1ul+iJma4mNXMOCAP8wC67fXNToxT4GK5psaeLKT0w5Fn43yu0zVVzsxjcPyqdaHqYjL
	 iqgcl1gToIExy2CcykSjkUirCiSu356j9S/OnBMf6NY60oMiRM3BDbPi0l62s6gK9S1An
	 f2yqtLDt0FZe6qvEVUzvtALuaEBvHJBK1RJyqXA+W6ZKfU1+FIvZMvox/QxqYanMt9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793115285;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=syD++ytwmVWxJtGfHI8abOuUUYru2aIJFUXyJ4SbMjE=;
	b=YfWC6RCv+UrpC69z6tkm+1YsyvXewiZ5R4yGoH8WjaxGEiXKvX5GgtkV6lGpN5vIPUP8
	 okACKk86S9EUB10JuVGoOBycG+lcffEoTxmNuWFeyPhK5GKXwO6CFV7jVO2KR1ddLhmih
	 0tZUzq8hb1Sav59cnteYg65F+sae/YrEvwgOGG2j3iwF3UAVDZ7rNUz+O/T89wuMZ0lsW
	 bGdNBgnWQGTFk0xUZqFuBQ8xxdxpY58Z8aHDYKEfvURHvilzcU7R1bVaesoB1d2ARMt9j
	 oLXDmF1+5ogzCKsLK7spIGdE7rpo3fcufi3jKkebKDTHnz06HhwS0CsbBeVAQ64GoSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VKzNRe3N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PS6lTxQQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454C1606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 454C1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VKzNRe3N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PS6lTxQQ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFL5Dk2242277
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=syD++ytwmVWxJtGfHI8abOuU
	UYru2aIJFUXyJ4SbMjE=; b=VKzNRe3Nojh20JcuWbwd2+fSIhUSQaVXcSvs9MSp
	fok1SmOmWKJA8bF/nqH2hioiQkkEyc56EOLGiTW4YRFCfWA2laCWLgCdJlUSp4Z0
	5OgJmmgZtWUAYo74EoOHrCm895/Cp0OvF3GYBcbU0U8SVCJt8jQv8c4b7Vl0LQqC
	UOqRLM+oHibom/s6856oR5engEkInoskYppyPYV/6QfYsqWYFlkMD8y38vQzeBG4
	PXLdtVp9o4B2I8LBnfkqrGS7oWQvd8fVHuodjEJDERrUK+/GANZCKNpRNoGm5ms7
	x9ayPuZgmXLdxoO3Qzf/sJrGWr/Ped0/YKFoTegq6/+D1A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5t04f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:34:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb71b1443so950031185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793115283; x=1793720083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=syD++ytwmVWxJtGfHI8abOuUUYru2aIJFUXyJ4SbMjE=;
        b=PS6lTxQQjNKHMS7hK+1p7ai0Ju45GTgiU9e2FDiGw8FZdubn60KnHqdq1SgHuFJsVh
         /xQ7vN09qUSkZjp8FhaV1RAanzT36tW/PDFVxNMSyBXrLHe7KKDRPPjQ+Ygp3GhoPwBs
         VXucfT0pShdPNuxhro9wedkGjqXw8N88aohyuV4CEzLfscFShxyIgm9eJlyhJqBSdcXW
         uiq5BMl1y5YlEr9+15bDvrXI0luy+4pP49LIXWkhD1nY7cfvkXHne3K9NXnibl3Um0JM
         gOQk9CvlpVXjox9p/SlPkay7JU/s/0CX2uZwPPOQNDEAJQLrcVqTBpRGuGAS4n2cuelE
         mL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793115283; x=1793720083;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=syD++ytwmVWxJtGfHI8abOuUUYru2aIJFUXyJ4SbMjE=;
        b=owwEOThvucupL8KWI76yf+WaGnZ2UgxUDG98kYuiUleCtmLmw6IKrCqDo9tUhUatHp
         lwml//wTNud+v934xXPOcGaFERy2Yp2+KR1muyAH+82DfsjjnC1+ynLcHB1E7+S8ibHj
         NGOtBXM6bXZKBA0vw4eRiAFDAH9MDyhQ5G5CpVUF+1gNVworh3l+mj2hw/ne0dpCeGxq
         5g91IgnGvM58uf5QaNnORbk90/CCx2vD9W/FN9XKCSNTIP51J7ttBxhCiwSs/iYoh5pB
         5pNJAEf/URflYza6X0q4ZQ/TrCiMde9SPCm19UQ4LfQ+E44GAUdrhPQHnWueBODddPzq
         3DnQ==
X-Gm-Message-State: AFq9FYIV/Sxppiqx5uYXC8bKILL0ZbJi5qNBm9xazoq5J/2O2pS0mXrh
	/xZs+oDFueCGRoRB41jLFs37a/v1O4FvlcnjWc1VVVRtNINI/TnncIzwBo07plCsx6bnBLmrSQj
	FOHF/A+JbXydsrxq7sTBUJCyzS4Si3xmqRZZ6pq31+t9oOXDiDI0wIbkO0YGX1zswsMq1
X-Gm-Gg: AYBFou1vhXYYyPmr4m3jfZ8Z0HpDiOz9ExigemMckOCJfPinaArDA2/WDMhTI1pQ5na
	jsoDFi8nTvdM4vG/5XnoiV4pVWtP0mKAqFifYXQw39F8TVRW8ylYiwKk+ToHnhZ1gx7SQFYwOTi
	hASVdwY4ztrQTCTxMwjGDKKEcHk289dC8ffr5Q3aFbzk2fA9VX1hV5/AxPhqUu8l7bg8zYBURQo
	MnJR6BFDWphHBbnjKAttV16RWQ/iClw7v8oJhuK4/rLjt/sDQNaraHdPZVevvLaIzcnSXnKYGsU
	b+ThbXgTYT8eH1rVw7wJ8OYivyO+qGQHnkcWdFo51cNYdeZ734VstWYFOjdHr2n65AnGsDBuiiN
	2u8q9qrVK9AWVcYGu
X-Received: by 2002:a05:620a:6286:b0:93e:6f65:de63 with SMTP id af79cd13be357-940ef8f8310mr1655475185a.47.1793115283235;
        Tue, 27 Oct 2026 08:34:43 -0700 (PDT)
X-Received: by 2002:a05:620a:6286:b0:93e:6f65:de63 with SMTP id af79cd13be357-940ef8f8310mr1655467985a.47.1793115282534;
        Tue, 27 Oct 2026 08:34:42 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f387sm23217567f8f.4.2026.10.27.08.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:34:39 -0700 (PDT)
Date: Tue, 27 Oct 2026 17:34:36 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: Re: [PATCH 2/4] firmware: qcom: scm: Allow QSEECOM on the Mahua QCB
Message-ID: <527ui7l3vbr6bzfqvlyre4lhw45323eqmfuy2ehqdiqvzzpmar@oztr3ibem4od>
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
 <20261027114955.1266499-3-sivansh.gupta@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027114955.1266499-3-sivansh.gupta@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MiBTYWx0ZWRfX0sgNG42qE2kG
 urTr1Zvrn3sLySNh6A8BdWhd37Y909fC1ndzXIfhTL18R1hyFLYIJCYUC/OnTXajlnp+vc5D9q+
 K4RtXwa6/yuHbABJUBggYcEi/3DhHVk=
X-Proofpoint-ORIG-GUID: L1zSnW_b2usJrZOm7qMedgrWiWnXY5IJ
X-Proofpoint-GUID: L1zSnW_b2usJrZOm7qMedgrWiWnXY5IJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MiBTYWx0ZWRfX9BxrEGn5iEcq
 cvSZgVGVD1cFftsL6G44V7dOJ0dqDeTNZez+lPphyGnABlSWQAfTmdr9bSsh7MUJUo+Nwmc/9Ia
 nB3Ngr27lWmmPV2Bbl5k/Bgew25KHXb2IykkqiIMhyDfZ/d+peG/b0gqGAmHpbWZ7lCyTFbYXbi
 gqe8du18cy7rtr5dRLe+P+Cb7MnSAXScD4hP1B5zuCCM0NrKUSrIjATdNDy3/vUdyDLeqH1wc5w
 he2pIabXSvm+r9uOn8YtnQ8H/lTajrl/ZU22wH/GOlt3Sp/JuiU6P7RPF2/d7N31VRX98TBpLl6
 mqiar0ElrA+fHiY5ZKsl3ur/Ss4H1DS/1AI12LPNPBk/4tBVUTFwTsiE2Az4g7cwuMAynUrs+GO
 Tpo17atIN2UlgjZoqxoZu+w3TeJIzBhmBONHWOUH2vPzvr0sODnpriRobAIzCk+vPTTKSdN3OIw
 ohzh5pueHGQKV5xaSfw==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae0c494 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pfxcL939j8YmDoyFsLgA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270062

On 26-10-27 17:19:53, Sivansh Gupta wrote:
> From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> 
> Add the Mahua QCB to the QSEECOM allowlist for enabling access to
> efivars and the UEFI bootloader.
> 
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
