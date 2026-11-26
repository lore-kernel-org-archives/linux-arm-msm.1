Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703283;
	b=jO/9+r2hclef44QbLLJ3ZHK4W54gBuo3yKhvdalu0irrpfBLl3ahgJwslkLS8r2/iRiQ
	 93twNckT3CA8nppF3inTLF5FFTL00vE94MqNEOy8yG9uDXdJnRRbPVp+DrZNf6FTPGcx4
	 o9Qj18GERc2qtiUn7ELK8/iHKlhTC0JBvrX6tdPXPrBi8TwTx/PSbM1ar/GL/Z58Gd/pm
	 1fBbHlONZ0nAETvyW6nTomE6Sj19Wa+yr00wSUB5peU0bUQd8kP1JhrCBLVHaKwiKsrBl
	 9FhcLFGFkAU/3Hkj5txww853QKI95PMd6UJcOTA10BJoXbuDc6x9QlBkyj9kbmWNrZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703283;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7Hz+V0KZEUKwYNABkLWPKOt8inKUR57WAc+UGW03IoM=;
	b=YHf5mM0j8OsnunaD6Nc3XHj3J3HsArnQYG3iH471JMM3MBuykzBBxUwJSfAV+ix5hivQ
	 vFv+ddqbklf4PKXRqyGT0ZkWwLwte2y78L/BA8OZ+NyOdGP8NeokZoxVUG5rodUOAmnVW
	 YjO3N83AGUlzKUkCdKyveR1KG2Xp9a356EOiZy/HGfd6JZHYi36vbj0KA0xkxSd/qrAFN
	 iswbzKyzsdW4scrJz9oVJQETZ6f69TKfE/MklZtqNRb3IHKY3XzEg1bBkD9ST5ZYGWJrI
	 St9Y7Gmcg7n79MTArrcuaoJr/q8IFh0DtN3aazh1IXGmcAtiG3guBI3kkPed+GBHcgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fm2kgiL2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LPGL+WW0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51769606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51769606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fm2kgiL2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LPGL+WW0
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVN2u4128433
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Hz+V0KZEUKwYNABkLWPKOt8inKUR57WAc+UGW03IoM=; b=fm2kgiL2cWg5RwJ8
	HFdDWNUoA/yk0YZOV+8RUXoFikuYrhEynGi325nG2OdMCTsaD6075+EiYmzqgWzS
	NUMdf1qaw8OCS7RiLSRlXCYOim/qKu7wHtkPI028cqfcV5j45FiJLtIDoI5kM2lc
	3aZ3HgH8aiYp8EQ8q5SC5Oxat6cXZk2s6osE6GDLIDfw09v7D1VA+puPzUNv984p
	1HnqGwy7GfE7806+8ASg8vmx5EAu9UETLMRu5tprgpIc7ZaHRBK+sL+5mBF6uGf4
	LqcBLfWteZI2vXIwm8/y5iiq6UkNYEGoMnhmbgIe+Qkt1Dwlj+yyAGZrnwyBtAkQ
	n4G+gA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vav9t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:28:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-54e4ecd1b4cso15991371cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795703281; x=1796308081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Hz+V0KZEUKwYNABkLWPKOt8inKUR57WAc+UGW03IoM=;
        b=LPGL+WW0CNQSZgyUJVv3qTaXwKwIek/gD5cD4sTkGMlARFggt3x3OjVje4d3xmGM8T
         davkXLjrufxKtAe0ihK5INOJaqCBCf5Egpae2XqVuTPSn9ZqsKwdx3pVw0Nfj3Ac6nss
         gHmMQo3H37ufCblREUylVzN2L7wSz7rqkKEeyApfddre9PPl5l4Hqq0uj737OfD+MIMw
         9l2QAR7S1PqnM8ZJsamDB3Y6ypEs4ngmlOgEp1GOkMZjfzlLBzmvtq6/5/1Am8xkR32v
         DVTixpR1YtcEI3kn4Nr70+oIt8wCSXop7ILFcDpe5bp1DLj/3dAa4AXsrtTVrOznsS88
         JoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703281; x=1796308081;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Hz+V0KZEUKwYNABkLWPKOt8inKUR57WAc+UGW03IoM=;
        b=WqjLGedKlN7U8CobMcCNOA0ggWm34TkKt256rwFrCGWf4p/jt6arOCw8fjciHsEGMp
         8/KAutcUgwTUkHJnzrVbVpaCuf3uFJq6Bfvz4PbxToaW8WpDrppmnHEGCg9frTWpNw37
         ezHFOxDCmkwvDevcr67jBUrFpFooi5jJUPSOYbLVqfbreN57wdNok7aXlJgTC5Fh7yMp
         4JGBo2OB+1FSU5eXKpwZOEeHY+1O3LIGvORVRBYCfjHcaxsWL5CxkPTnTwk/zN1WxXud
         QYOg1GyEdsd2m6Hr8U4XK/eRezIUT0gpIPAhF0y3a95p5aw7LNZ9L6fDkdaXcy9g+X9K
         T2Rw==
X-Gm-Message-State: APuU4Z/xtgtgRm65sZhj3A3IsSjg5PQLvCn5lgH2nOSDOVIIoKjzPnzF
	ozRWDsZLQL1VR6i3WTr+xX2bdraJiMl+02EnMf1cPpNgNKymVOfh6IrD8kLYcn5fgnCH51rGlYP
	nNDpP3kh6IVWhDDwlBdsghgwrsKoAzKsxaVA6nuXqysJIejxz7BKan2c9MMPVgz2R+yfv
X-Gm-Gg: AZFdTZeJlNcmy2TDtlSch5lU2YPvAd55fg57BNUEDQM1UAs6jrNBX7knTN3jYfyUUqm
	ERGS5nnH7JR1eSzP1AQZ76N8JPExRzQL3XUY43i7lJdg0awk09bTufkS2VgIevfea7kbnLbPlW+
	uQW41Q0KEFS/sxaQm+MhjK/3moeY/F2BZ6aSLvpr+9WA1lqrvFPE0ZTPO+KpteIbwWqtADl8Lm3
	hZ7ISdT+kb0Uk83jKVJ4SEJ65laDtL3G/TMlxDWasL5TX5DvdIfgFBVF4V1cCqPgiQDHTXoEhsE
	9c3Le2T+hzts0ZVaHg+HS/ha3bhysJyvIe26+3LlI5nQDhvKELAwZ8kUvox4xtwv8qocPAtAc25
	PJ/hXnREQZiXfRHsh/0ADCIWPsBk4f0jsUXavA2R78YSI8gw+Bh98RRnItsUmfFyALOr/ils=
X-Received: by 2002:a05:620a:a914:b0:949:afe9:5539 with SMTP id af79cd13be357-949ba8e9975mr3995704985a.2.1795703281508;
        Thu, 26 Nov 2026 06:28:01 -0800 (PST)
X-Received: by 2002:a05:620a:a914:b0:949:afe9:5539 with SMTP id af79cd13be357-949ba8e9975mr3995701185a.2.1795703280974;
        Thu, 26 Nov 2026 06:28:00 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc73d3sm756279266b.64.2026.11.26.06.27.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:28:00 -0800 (PST)
Message-ID: <d7901f88-af08-4a62-bf0e-cd7d858ec405@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:27:56 +0100
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
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sm8350: Vote the GPU memory
 bandwidth
To: me@fromdisposition.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20261105-b4-sm8350-gpu-v1-0-a7175cdd6512@fromdisposition.org>
 <20261105-b4-sm8350-gpu-v1-1-a7175cdd6512@fromdisposition.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261105-b4-sm8350-gpu-v1-1-a7175cdd6512@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfX7LbI5JJJi6vf
 uEgEIdDESGdZ3gCOMlnCJzpP5mqMYIGRB6FKzUnkKy7i/ISrpuhNfywIOXrjc6xKW2fP9DuIis3
 j7K9CwlRAmzpXplGBAJ3GX6oOKsHr6g=
X-Proofpoint-ORIG-GUID: Fvh8SHrcxibuwIMfv7PbbdWuFIGKYfCd
X-Proofpoint-GUID: Fvh8SHrcxibuwIMfv7PbbdWuFIGKYfCd
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b0841f2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Tt5JBQAfAAAA:8 a=EUspDBNiAAAA:8 a=L780p2Jx1yd6vCQwJl0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=kpHMOrJS8sLNr5ru0mYA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfX7ZALUkR61Gbp
 faefxGghaEB6F5bpZtSReUqu23ZC/oV7py1Z3MtI87xo7fQWXe3DlViWHdSwDiwr0rq0sQhxHxN
 Vom17x/NPFRAGe8ZutbF0CW/onEOJt3DWOZVrUG+iTgmBg6YtL4mRMC2myfvU/KLGtNST+w7Fbe
 8veo81Sk5qViw0skUGE4hm0AKD3P7ENryOVtXNyQaoSplJTgSSvPSidNnCRBk2xAr07tTv3RjeO
 pzwXP3ccieyFbMaYUHYzByj0AGirf0JvJAEzFy91pecFFJNOzkirP4DgT21XWAMSFvJ2VtlTp3S
 yD5t7bpPPl/tHbFPELT0nFf1N/WYtazIAOm9f29jIh8fXxN6wfHwLVLcvWRrRA/SVEwlFAsZgTv
 iwL24xhP8g5ei8FnEq7AECF0dpRfM3Z3gvCGwq35jmNqaFOMTX+do9pP2RQ3A/DdS/n9qsgRnod
 VYdEkau0qtuOBgyFPSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260056

On 11/5/26 2:30 PM, Demeter Barna via B4 Relay wrote:
> From: Demeter Barna <me@fromdisposition.org>
> 
> The SM8350 GPU never asks for DDR bandwidth. On A660 the GMU gets a DDR
> table with only an "off" entry, so the driver leaves the vote to the OPP
> core, and the OPP core votes only when the GPU has an interconnect path
> and its OPPs carry a bandwidth. sm8350.dtsi has neither.
> 
> Add the GPU's path to DDR and give each OPP the peak bandwidth that
> Qualcomm's GPU tables for this SoC vote at that frequency on LPDDR5, as
> kodiak.dtsi does for its A635.
> 
> Signed-off-by: Demeter Barna <me@fromdisposition.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
