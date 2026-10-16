Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632FB453A29
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141756; cv=none; b=iWsa3PvIKZwfX+yi6DkPiUx1YH3ogTJNhvXWtVbZYymIfXpSJDGh+NHDaqITHqjZa5kuCu5IsbEQ1IydVQUd5usbZO/i7V/pRTYf4suk0SVu7NHxSKcYgabcHafekqZIGGU3obz+j8pmaTstre6IGWaqv/bk1RmRSODLEyl8RcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141756; c=relaxed/simple;
	bh=lyvoeq0e8iebXlLsQyQOWuo6au41u9pWEqiAdJIh9Ec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qNSLT4//Cz+1X9KBDwrrIKTfICprG230nahw9EftzjQnFJlFaFdDp1jUlSzzLSc43W0vZlcYm39bDBw2clTGe0NWsU07Y+PVwk3p/PSNwbPV0D+rsErTTFTTQEUaNaGxYUse3D7bf764tWVNNDoIRe6xFnRzETiOyyIeVPu2E+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ARk50zr6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jrl0TYjQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ARk50zr6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jrl0TYjQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8luHO1611450
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I2Y61SbarNC1NRnPllqbF3Qp+uuYMSjYKhtAVsLZu3E=; b=ARk50zr6m3Ulzobk
	Fy8URqJ1oVGMLtdbHqnYnRv84JSNMxzau0MmfzbOAkygZW9vRUd+AscGgJBO8bQl
	+2ci70X87BY2ea2bxh9Y8ThaXS06+7xA4x0zuTlJtJBLfA17NeILaC6JokLq3AYg
	cSKedk95t2G92JDJsOMPIstIA8C3eSfhLbAEXgUDbsHrPdu/klGgnElkogCh6JD+
	CSM8Dd+99XGmrxq5Uitk9tvNE9e4MNauCm6Fy3Uy3a8EtNAbga9TirOKGc3r0CnT
	viQM9o/NbaO1NWYSP+kMXEsIU2fYfa8GiA459iIgtsqrAGONl3NfvBF32zrlXZwr
	5bMp0g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3setyjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:09:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac58b24so93998085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 02:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141753; x=1792746553; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I2Y61SbarNC1NRnPllqbF3Qp+uuYMSjYKhtAVsLZu3E=;
        b=jrl0TYjQ5endyaQH5/UqvUndCXSl6wQwrAg0VJNRWim8MlcPTJa4AcknD4xUzMztVk
         seBCwC9gC3hyT38jpP/ZRFuZMVBrFs/2v2noF/tFbj3GYmSiQOFu2m/xY/QCuHY5fEFN
         yu9eakcRBTnoPRTg9+A185rgcE4cBv8qdeXiuLi2z+5GaueNQUS9gNIVqqpWmROmBn4M
         SNYPeqF/vpqVdyWsCJ58g0OyzQ4xmxQ/23QO9+4KpzCow1dRUudyU0WJvK1IfUUZVKDA
         LCGI19hrRlSbcfHd1UuEYniZAK5DFm7gbVHTANGD4czJQMLpJxeDdhjYytH8i+InL9sU
         n/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141753; x=1792746553;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I2Y61SbarNC1NRnPllqbF3Qp+uuYMSjYKhtAVsLZu3E=;
        b=UOdxpRksTRmtZU/1nHgvvVw5d5KSfxr92q/Cjv+hUqTn+iLi4ypcKFBr3aF1YoRrlU
         Bfzjxp5+b5FGPY8ywH1UOr+1zKAIbd7TNZ7LdtYvA0FOvZkaMIusltfBqlLrNeIJFrOH
         6x1WeU18lpmtBC4hk45/gtcQHgHIvkztmgURLmgvkHuZZxmsX8UfUq0nKlEjRLcSYCM8
         GwLyZ+SHhds+hBsk4KG2SlhYjaFQLlSB70D/nse8psPdrz/e75Na5mPq7YDFNh7OCHbj
         lydoYa4uxjUJumJ0r2KbSX32urT0KeXFm6n605XMhIATmxh4V20tCXrHjjDsPBNa24vE
         ZOJQ==
X-Gm-Message-State: AFq9FYICRmrPFdXIXkoH4yqK2pRS7TlF03nVE9kNmRqUhoGCmdSUn/D4
	wnFFAy2XXqcZOYQSFC4zoBn7BO7N0/Bvsd+SCfBVfaunoBQ3MCL4BZD8t25fYE2C1ouXrdHUhoS
	YNIWEM8O8oSU8H3zyleqzwlrD8reL4bdi03cLVnpga5GMSisSns8MvJWlRWJ3/SsJAxtP
X-Gm-Gg: AYBFou0uAkWttqhghyEfG2/HMz3LkYX+Y+jEImtZmU+yEfbwBPLCeCZ4CyadLG+6myS
	EMOth7myLe2KgKcybJ59lgoGU/u3mDgHJa5I+a+rpdPWbphOdGmgne/G73upZr7fsYlo6JPLROu
	yaK2CNHfQd/VgSqIzTneIPKoUx0wCRMqLE/6TToZ9oDFPeAJoiMc3HtO7gWBDxQ+vflhydXuc71
	K1EkFNDqFxddT6iS7mRrQXrt/A/Hhe8z1lnh+lMeZw2BZWUlfd37SSOUvU1YtpPUwrYOvg/yHaJ
	7dzrBqt27UuVOav53kADRuGzfgFYymXEqkRyCn+C3UCEtmtaBhHwDBNKMtfujFRLNRalwsJnDCN
	zDjynq/8u7wqjw0rR6S98Ug==
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr3675062385a.0.1792141753542;
        Fri, 16 Oct 2026 02:09:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr3675052785a.0.1792141752034;
        Fri, 16 Oct 2026 02:09:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb256csm53638266b.78.2026.10.16.02.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:09:10 -0700 (PDT)
Message-ID: <4faab1aa-18d1-44ec-8a3f-79d732f7d0b6@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:09:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: kaanapali-mtp: Enable
 DisplayPort over USB
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
 <20261015-kaanapali_dp-v2-5-c15cb83d9140@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-kaanapali_dp-v2-5-c15cb83d9140@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BMnD6PuYtvZEPeqXcJ8vUZoBVcPqqG9D
X-Proofpoint-GUID: BMnD6PuYtvZEPeqXcJ8vUZoBVcPqqG9D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX4JYvgyXS9LPG
 xw4D4c7ghDHgVcvVKERp7OrPsfgxFZH2GthyIo8qQnjdcpbWAte447cPgN4lbCp20LIfHnArt9X
 QBWBa07xrGfNN+rRYGfmzrtuJ+TNC48=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfXztLj8qCvuWyZ
 LSBNaV1tlnEYMK+KDRwS7Fj+Jdgjl1aqoYD2Uao2sYFh5rNqJSSttbpm6sCJ6iZb7XO0z4gj0OU
 CYZgPlcVhIgyynBFl4AsgtOUnGcFb1jX8kqHLibEjW5RFTJTj4cjxYyLHObZ+D6KFP7C2nvnSin
 cU6keaDmsTVMhsQ3dykCb2wFkO2y5m+8W/EpwEaIaMQR/8nhjf7ErMWs4le5t9XVHTRtbYSQ5Px
 6Gn/2SXoaGNPC86I+7X11SQR/Xc/r8yWaLqeIzkGmWNp+7sn/2w0gt8xNJxF7FOOheEY/Rno9Gk
 fPyGicTun+F1tOewjb+QEjiYZW5qfwPo+iFW/dV14yxB1wWPvMRq+GLZwZRLKhPltObdmSlfu1K
 qjtTdNZnmi6WwTnDuGDdO1+z5dsj1iHLdwcD+OuUSiB6SDPq7/0QCTF16/itfBcnQJgnGKu9XSI
 uAlSLm8J2H6c39EEtcw==
X-Authority-Analysis: v=2.4 cv=Se1i5fRu c=1 sm=1 tr=0 ts=6ad1e9ba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=8oCPm4Ec_qhLfyN9vMMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160036

On 10/15/26 11:54 AM, Balaji Kalkonda wrote:
> Hook up DisplayPort parts over Type-C USB on MTP.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> index 22eeacd7aecd..3bf7baa2bc82 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> @@ -1017,6 +1017,14 @@ &mdss_dsi0_phy {
>  	status = "okay";
>  };
>  
> +&mdss_dp0 {

Please keep the nodes ordered

Konrad
