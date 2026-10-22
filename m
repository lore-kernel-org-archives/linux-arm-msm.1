Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665290;
	b=K10Qh0/V412OTF+Q9BG93jmx+2etUMW4SDtSVBrICoBvYbJ7SW61P6C8K83q1dpBBCD2
	 9XTtbBuM1YoI9mj++AH6RAs5mLpEyDt7suCXL+atJLPE1+HZZ7JfLVpGjzig/Gc3zBu/N
	 m9gPLOl9mcW9BTOr5eeT1u9Xp23Ug7PZ2NWAOQXvIWccxcW05JWt+vN2yq2Kf6qg+Y8yS
	 lH3atntJBAg1SeAfGe0FUxOklq2PdFOGf/uNdMZX14CNWURAKawizIB3L0ohRBWvYiq8F
	 o0odTsFiiRTn75hahm/M0g2iCkCmxZbMXlTBusmTsVk10CT8fd8H3VcO9cmoFWpEYWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665290;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xUL97CU/jgcRIW7BbMZRfUUfm2sRjdBbtEqx9vbcTFs=;
	b=PaW7ItE3JzFc5xcG51rz9jIpa1ZkzH9iU59gRbSJg7roYUY8gax0fgxWM+6HFLjh78sf
	 iSFPmFU0IUJ1U/9cJXZMRTemtHGblkvFnN7WwgAhP0NcEYD+DasBS29Go9+x8d/4WMw+Y
	 uwmtNLVUQnf+FsGz2r0dKP3aSDcq6ljZkhrf+F5VtGWGYvFgOWG8H1R3P+ew44948MGKY
	 1+dvrqOPOwtxegwLfTg0S4fBbk/tbmxuNHci04nZEl++H1o4SlUr0/Ye8pH8srSxdZIbV
	 Pshag87HY2K534qWtbgDXSHLyYIuSxA+WHZjY/OzHMhu83vUgQrbCeUDiEuTwW7u7yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W90rFzBb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VRM6CzOG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323F9606A324
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 323F9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W90rFzBb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VRM6CzOG
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0KRU3995484
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xUL97CU/jgcRIW7BbMZRfUUf
	m2sRjdBbtEqx9vbcTFs=; b=W90rFzBb77CYwJoHUhSocLtUCZkGxMkQMwzCRdsj
	YTgZFmEuESmUhYNib+M2Fe5hWUssF2bN1u4YHPYh5/RgDYMb783yCC/dHvpPb6nd
	sd0WL5MW1iIEqqQTPl2v9783tWyLE0UGo01WQtgrY0ITKhLqnwDqDHcEroSpC7Ev
	iQ7kz8RVzoyYLbhyVo8eX6CwLk1IA/TKoFOug1lRaw7K6E3+Ut6JNmhw3d3C6wiZ
	Rw3noy/m0QZ83cJ4yFxsQZrghqEGXgfclWGmALBSEV1BZSkg0mQgCpYNAdjdQRtm
	CHXwcqQ/BAkZ3/97OUNNs/yQxM6QGZP2kc6nHxzjIDfNFw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ca20p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:34:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f322ef7d3so382892885a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 03:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665288; x=1793270088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xUL97CU/jgcRIW7BbMZRfUUfm2sRjdBbtEqx9vbcTFs=;
        b=VRM6CzOGPDzN8mStW8JANjU8TeBRryMCuBBtOKaVmphBoM61nJcfkwFZ8XFZh+qtpm
         fjmGaBtjGdGd/hEzifuZ5xXzxzFGMLe9pGcIPA/tMpQOBYiyFBWPLz6TmRjDkqSIjnqQ
         Qvz6vGUN3dfnlu4VqVBXI0rKWr+vnHj6198KAQHeS0Wfp7S7X8RQpZbkZLT/zyLSz8Ih
         sc1UgPEKOrBuXPqBMTrGJI+EWHyM98pWaJK3VPeHE9UhtElmE8/WkQ6RG4ixs4jNE4ZQ
         FFhtKoWyi6gjB8V3zkUC/9w8ypkGz4FlqK0j5ohgO1wyBakCHOWFD12TvO4OSZmZgYLL
         ctTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665288; x=1793270088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xUL97CU/jgcRIW7BbMZRfUUfm2sRjdBbtEqx9vbcTFs=;
        b=duRdgt6SGQkedMeqqW1bqYUfQPYIfvBQ6ypw9UaBoDKKU1v8iYk+CJf84d65GfuiVP
         MI8ULrlFmvrNQxvpCKaiUyLYMlv15oIONCCacog9b1wSA46j/6msi27Yf1oQjjXu1GEg
         v/QAo3bKaLfW5Vs+E0R0zJh9V2UHWc9ZlauFT6oLqJGqbA19ngkiImJnlwBFiviWiZRu
         WoUkKYLqbKDrcBZCdhEU5CkkL4Cj1M4/y6pQtLH8DYtMw0d7YROTCkPVaevnQy3xF7Gx
         UcDlsW9kOG8UgenfC51YQGzZdeyKea5fjlHO+nssdqSsI62Ihw/+OT7b3iBAc8WH30Kp
         bG7w==
X-Forwarded-Encrypted: i=1; AKwUvBy1XZ352Okw+cpd+K6UjOtwltIepyftXkXPQVFIsIcRiZJIQMmapqI9+DMhtNSKv/msMWmrkiEQKRvH8CvT@vger.kernel.org
X-Gm-Message-State: AFq9FYLEae0XXZ/ZP2ABxkJI58MkyRVqOoPsUjgrUYFP4SPmLIdUtx/n
	SPTbuglh3HIp2XxVAFhY5nWFXs++OSP+HIXw7zogTkdX1T0wOfiMXvrreTBXBO65n40XBBP2LDi
	SG+C5obgKbY8qO4NNqwDWSuj7S8b+4VGXXN30U5EItMJd7AtYYgSQizkb/FgVIbHywcSt
X-Gm-Gg: AYBFou1pTYdpmS9l37HEr8QwAzbuBM3OUPrDB63elHKBfZBCbNiRuIRJ8lcTWJ88SrO
	SxD4+RdiSJ4eyiBh1Ige7LbufXVe6KGeXukOtTJCX7lU37K4d5nE5upAoRJVLCN/RdnlIiQxXcg
	JFppr9A34vY0TtCRHSKY0LOD0C7E2NXn125QJ8ng43Pgv5EugUMHpBh0yBr2O0qjx2h5I+JIxQt
	k2I3O3VKlqAWwGNOCn7sbiq6in4KQldu1FbOQq2vUW9MTrraftD8a2pLiltqHkTOGj61HJ+GAC6
	W3SrsvBOlHf7ziuLS7RKyj2S+hPPEEYH2m2zV1dIMHb90XLA7D+ots6C+4eblxTwdHSG3wjKx4A
	ZOIo4fMyxLmL/60lPCpcdo5YJ1rqvZ5O1jBI2WiWvpZ1ZQirQu7mU6nQpvPV/Dl3vrkcg2fmW8I
	s72ti5CdX0Cs5f
X-Received: by 2002:a05:620a:7014:b0:93c:c73b:39ed with SMTP id af79cd13be357-93f57f53ebdmr837298285a.39.1792665288509;
        Thu, 22 Oct 2026 03:34:48 -0700 (PDT)
X-Received: by 2002:a05:620a:7014:b0:93c:c73b:39ed with SMTP id af79cd13be357-93f57f53ebdmr837296085a.39.1792665288050;
        Thu, 22 Oct 2026 03:34:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa28347b8sm865280e87.9.2026.10.22.03.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:34:46 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:34:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sm8550-hdk: add DisplayPort audio
 playback support
Message-ID: <bwcdzlbrpc5jylbujixkl7vgnt7vqf6seohzeaeznunirqcokj@i5ocfl2odomd>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-2-8a189c71938c@linaro.org>
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
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-2-8a189c71938c@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MSBTYWx0ZWRfX39XLRjV81K7/
 Z2fZzUbEIBx+Gdi/aqqeVlIaCi6+FXzksHkS8fAA1XoOAz1dQcEzliiC2XZEEgBue0ehU/K2ZbW
 z7giccqvFFW94o+MGtSL6pwOe0SvxXI=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad9e6c9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=hwhmpsCkSw5bT3se9GYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: EwPnMvk0AtigpUWU2lmPx9YyssizrYIO
X-Proofpoint-ORIG-GUID: EwPnMvk0AtigpUWU2lmPx9YyssizrYIO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MSBTYWx0ZWRfX06QQe6I2bmKQ
 e3wWD8xtt7USqMozQpAqTI9ACYpQYe52z5/EJT+mhC5b2LitdvUeBuEzTcLdpLclj8u/1R2DsKO
 dnmpPPE4x+byjcSkN2hrh5iE9EDzeNPHFq8js4JOo6lFuNUgU6BjhR+zVuawg7667hXnnwtth28
 ZL9161wkggAvZrCvH2pyqltL19YQeToLARLJmO//o2flLVMomDLj5KeCyHE1jDMUEkTeWZuqA5K
 wNdZ/x9+p3jRAZqYbFeCmifQpTnwZflMgmvnIRLX/9medTKpo0kWpXnOOzHZ85TROf8Q1CDm++D
 +DRdJQ6Zjy5E5vOXqqE84IdjZ4RDqcpXd/jgpzMl963jfUmsBCC53IRn3M2hDoGi/WrWa/TnDmc
 SjtJrpk/EzNirgNtdWAq3Ow8qHZD9+qmwe8dyDyhCacp1ENVEDqp6R6qkURmUMswd8c2Qml643Z
 KBhrjdauu7yor1Z9AVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220041

On Thu, Oct 22, 2026 at 11:36:22AM +0200, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
