Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699897;
	b=cKaJP1Vm9IEMCfxgYd6NlJRyZ8ENjtBnSxwGxj2h/0fZ8+O5FuJCZIYjtNTf0EMM2r3b
	 ihb8YAp8lLrkyt7n5w9v3AoVxFHdxvyBBSVnt3sKNTuiGOsxrVVYaDtkoRBhsxDDpDCfO
	 Q33TcPbN52AFFpOvGYr7l/+ipG8JXgNDwBE4SzrgZVKnKcHKi3V+XzAMpTB4SqjU9j1gm
	 QI9jcw39PDvtZqvgOcrbMue0kgwUC+CPVHfripOdKGXCNrHrKTB3r5KqsgLFX4j+x789W
	 SVXRWkg+DbRJvgSGZOZpxiRMrqwFoBRlf0B6j2ke/lLIxzP05M0RLmKX1pIgkG+od/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699897;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m10pz6bgz4a7grQB313xpGgHolpNKLCmq7Y75Ebr6sY=;
	b=Pctr73Q9RbQU3uQOpXWUPwOlu9I9mrcKzEvFQh5q10CFdBhtYFkMc+H/SakANbutcANz
	 y+oQqrmfIq70YJsY1rAFe6pemTjjqN9bgSHI9EZ+TGQn4czgiZli80mMrY6c/jQ1ruEwF
	 yQPSG4J5j4m2ZBi656RDs2us9IFb+O3muMavj6OINGdW4SfCAdxmJdQ7fkEFDqZPe4FBw
	 mgElQAzZFjUfjZHFp/R+eg2E76y+ovE9R+xBhdAUdpBirJi3bFMqH4lXFQExoNYyTQijk
	 s08uAcGLv32CfKGvarEyvgvUEwT6O2eVP/EDM/Ml/WmKEUf8qbBKiiEn+Zbe9K9Cznw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XBgGzfkm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h++ii0m6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC24606A33A
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 09:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EC24606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XBgGzfkm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h++ii0m6
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38YLxI2106631
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 09:58:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m10pz6bgz4a7grQB313xpGgH
	olpNKLCmq7Y75Ebr6sY=; b=XBgGzfkmI2zU/pks3scJQ/zKjRN2l7JRX+Nm7tU9
	xuotO9A0Jwbbux2WcYS9WB8fj0UNjNbyZtm1nrVkkdO0Zi0kiD5P/ynRbvIjFx6E
	DFJ4itFypb699z45BP2wMZfPuDrav9jwwp3iMxR62499Gb/U33bNyQQHoLII/G2d
	/61D433/RAsm+5NFvrWaZ0gPJYmogeVGxOriCsPj3wZjUdK1x2NP1ADD8ILDeLcZ
	5ORJejjuPzAXy0KaXBed7V8qWrx4xscDt+3ipCf5RdoU09TJmY2eAHIfNcHrssMP
	Pyv3jxfxmzpsuIBJeP3ReDd7xV3uo87ETT1bFQI7otNvFg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m99nj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 09:58:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so107123485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 01:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699894; x=1794304694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m10pz6bgz4a7grQB313xpGgHolpNKLCmq7Y75Ebr6sY=;
        b=h++ii0m615QC+Jncj4PxaGjJfWrg3gsfC/AhsOiHgG8haH/dJ9yYgY1r7fbV5ya3pc
         W8OZwU1MDoe/C20fd27x1d2Dgf6SDgHGXHPvJRYNO4tvzoPruEG4KEStz/FqdQR+5DxI
         HU4tr4gma2E9gEfEqstdYBX6PIciQ4JsrQF7Qh6eTpltEwclwkbI4LWpd2mBSK2cAqby
         AQW8P8PJRIr9Y39tpUp2hHMhnWLOEW5b5mB99gAH/C1bu3YV9TPphb0PyrUJRK6oI/UA
         bPMeRtj18nD6SG0AGsCB96h11qDULdLyjYbjoW2UEiEKpW8WqkARTzXC6mZ/NKxXHi9y
         gcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699894; x=1794304694;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m10pz6bgz4a7grQB313xpGgHolpNKLCmq7Y75Ebr6sY=;
        b=Y5T3QLHmbFCDIfEhSHrh1HdX2j3/OuoALz9PUXeJq8I1UOoUfrxPeju9TIT9PAy/F8
         WEMLWEgZ756lLswHO71TGoV9Y4IC/A87XlEPVIcYnOnUvnGbrf5a2lTDzlT5FI890LDp
         s3a7c4/bUb2rvhI3yGZte+wPcPKTNfWcXq5DpAOXGMfkpqrD6/m+rIlLB0Uli9H6HGHz
         /WRiZ7Pqn0JSRXHAyuGj83dg4hUCLLaM5hLZq11OjHY5zBXzXct//usJ1YoKESo4vVFX
         1RtV1r333DJsYdVzgyv3/BfWjgs4sXmxxcsRW2htKNbGSYXPu5LbUx+zdZUai/7Gvjoo
         rdyw==
X-Forwarded-Encrypted: i=1; AKwUvBzfrpbLJ874x4CXWkPG92rE3vifxlH3nq0g2F/9isTacuNxjQfcXzv9RkQ53jrbGtIUD72XLFTV+lzbP9tz@vger.kernel.org
X-Gm-Message-State: APuU4Z/M5rN7Ua7NSHkPwM/t4QSJAHmieU5YT8jkxyoWRlogT8IGvGx/
	8YSeMFktiXotKtK/XopVGtHqOvMrshU2kB/KAf/hnJ3m0dN14Yr5N1R5v+YdObl9vd6TyPc3Mxg
	DApy8auAwy9dZwSJDJprcXBh6/ChZqXKX9Vy78mDILL4eQ1P4ESCttA7HJk982+CO4iMn
X-Gm-Gg: AYBFou3T8u/gMA9dgNMkW0Cbs5I52HJ/XOcMrROKXYtSbN2D3IVbniQ0Om1oe1+SUna
	vcyKsTBdeDLI7ZnZJS3q/J3fx/oNOqaxysmrqufrSXwV+Yx8i9enTk4/LZWtoHJBLMZ63Vpod/4
	eCor+4JrukV3CP6s4sma68Ai3QXaVPyHTYFctcS4FrkZ92Cgy9qM1pSZZGciUbYa8PmEBLHVRkU
	el2Gj2Rh6vN/9j9AaammRut5swucOkSc7KvuMnle+K+3rrRkivKkBzPePIuNyemnOBeUDCg+sYU
	t5yco2cqfR0bS6QdPuLoDtis281KRG+kIk9+tfo/wriBrmRvqhHCiDu5T90dNBRTLWvy6Kea64J
	sez+r9twU3N5XsuK+ZdYflyTw0oqldAA5FHpzUwkW28+08axahwA9PWtXo5g7BRA=
X-Received: by 2002:a05:620a:6013:b0:93e:5de7:fd45 with SMTP id af79cd13be357-94413382637mr2082786185a.18.1793699893598;
        Tue, 03 Nov 2026 01:58:13 -0800 (PST)
X-Received: by 2002:a05:620a:6013:b0:93e:5de7:fd45 with SMTP id af79cd13be357-94413382637mr2082784685a.18.1793699893006;
        Tue, 03 Nov 2026 01:58:13 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm217341365e9.0.2026.11.03.01.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:58:12 -0800 (PST)
Date: Tue, 3 Nov 2026 11:58:11 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] phy: qcom: qmp-combo: Update Glymur USB3 settings
Message-ID: <76rbzfynxxjfejmlmv5pqn7t5ltrkwfa43hf46kq6lyfeiw7p2@o3oqz2zmtm7w>
References: <20261102-topic-usb3_sequence-v1-0-5b144f5e6865@oss.qualcomm.com>
 <20261102-topic-usb3_sequence-v1-1-5b144f5e6865@oss.qualcomm.com>
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
In-Reply-To: <20261102-topic-usb3_sequence-v1-1-5b144f5e6865@oss.qualcomm.com>
X-Proofpoint-GUID: hKc5dQqwwXsDvqMWiimmnCEcGiTK7-oI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfXz2XgfXzfI9UH
 jqQgDfevLJES44RbHd1UeUS/k/OK7bSFP+AoX0oBqu5V1INKsK9EUFGc83bkmTqZhhbyaV6hKAr
 JDqrCfaYfnyigWPpqFpXtjTlr/WtS50=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX9ewwQny3uBUT
 JmGtdGSh4MfaNNfwA8tmRUUcpTqouvQyXGbpXJDXz/ufmuWdSKeL1PibqiLCh4pm+iv6qNEUxSe
 h44mBAHykUMaSYqnh/Dx7RY9WNJw0eXFvSB+mLEWOu68gLX8jYFfYacjo1nzhkT3UukjO70ShLO
 pkjmxHmZl6BH/QUz4JomKdOSs3K4XYvzHdp5n5LuGDDddDBdbHxaP6AqjkqL6f02rAmXOFUOv9A
 xNmXCb/xyRa12SgJnaHalfCFvoak4svZwM1xgzOGVbtdqKIqUHQGVbjQHhsO8wnVlweFhC+1Tw9
 QVzXU6e3DR8oTXp6AwNAbUaQ06DQuPYHXNFv/ouY6FNVW+Et+sNHlfrU0nXfjUX+V31Yul7DK22
 e/jZ7EIPIDotvwiCa3vdhPmK9wiluwcec1dlqjAte31TbzOOpNcxVNMn/V5ZBGmrmdp2Xt4I/Cy
 vCy6IKy5f1KBq0WrByg==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9b037 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=fJp4sGKrnHNzjJpNMsEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: hKc5dQqwwXsDvqMWiimmnCEcGiTK7-oI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030039

On 26-11-02 14:58:36, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Update the settings to match the latest hardware reference guide.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
