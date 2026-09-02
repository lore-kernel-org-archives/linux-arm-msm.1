Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98A84AA022
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 15:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364455; cv=none; b=hFU4pW7FvrfiySxRG/amu1/24vM3n/UsjRr1EuSprnXmNPxz04lUaJ3T3D38/d9xxj+cEHSD5CHaJsrtxR0VytNFFEMNFXeHNMmqkXljRQQhZITkgSuiXyc7upy8SSgP2M5OcEzkJk2R11HaWO+Uzhnnh5ndFkX7P7yTKiit7ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364455; c=relaxed/simple;
	bh=8XkQR69hwEkdBWOnNWghUOPQrJvnLIbWTv55zF3ayPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pJy5CGmAlIfTQYlCCoHl1raTm8F0s162C6fJgcXLsxG8jZjU6e0iLjmniSgVCjnObqYCfvyW4OPEZ2K3SvxeOP8tF7L+ivxMF8b8FcwYH8CZwLOrMzd2pfIqnKI2LZl7+0mH9MDR5EOUe/4+/h2OFK1DshBGfUzSEqt+3b19G9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtnzeBaS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G4Gq6Gxg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtnzeBaS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G4Gq6Gxg"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZFcN1347736
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 15:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gPGg7DDrpLKa9Ne0/+4ThJpTtAnLafNYGVReLir4eCM=; b=BtnzeBaSF68f8XQ5
	jO6LUojPP2V3cqVTdgMMh2jPUGKkADB8gn6nbfb+tFSyawg5Sl2MBapSli6c7DN3
	oRP91xdTc53Fe9QQYDrOlkiT1L7FP0BkEfWzKBhkgB3G1WpVXOwG5Ce9p/gSS6RZ
	W6YypX+jCP+YDt8CG5xdufXzot7MioZDzyE7d4zWyypqFAfnsyhH9s646qlVmwAv
	00zwuin5CIa7tC/ykBCkl9M9I39ma+YQ/GWAHXffgZVMfWoK3lnKZUrWdU04QMzq
	KC/j8bResmK1xq6v5UR/fv/3/L0HG3yXndLGD6q2D51kz426DGuv5vNmPHefPV7F
	RAaObA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4rkpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 15:54:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9310484c005so26188785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 08:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788364452; x=1788969252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gPGg7DDrpLKa9Ne0/+4ThJpTtAnLafNYGVReLir4eCM=;
        b=G4Gq6Gxg5P53DAWcfcxcf6wSjOzX5XaIGo5FcCl/Wdkcn0IVyd+pb3Uq7fF5TQEup/
         Gr7urC/Pz8R2nfYXfAd3j7W/oo6kb1RHY093vxWxU2WT7Y1zl8+022D+GOfiPHzTL20g
         ybmxjDupS5bF3DhsNdBzTNfIQKrd5um7bSytkCEJKOpKqSnVnV/Py/vA0ddKcwcVAWd7
         9naKn5F35OwC4X2uHzSHFvHZUScgDMubUZHwROMDgkUMQ9Bw3y/ZILGbjHjLh816uF9v
         IxWgSF6BKr9IS0qtdwA1yn/LnQrIb/2Pjqs+uPpsLWcVxoM28VUeM4eeWvJIt+kk6G7z
         KmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364452; x=1788969252;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gPGg7DDrpLKa9Ne0/+4ThJpTtAnLafNYGVReLir4eCM=;
        b=k7h+V6JuxpXpuDJbXF/wyKOvvyiD/JOO6beVKtVTVAODy38GFmnVmVZ+zFetPTW1i+
         sk0mXvzQHOtt6kDWVlSO+mPLOxkLjVwuRdRgi2QUUgYXPaU6MOtlctWizXyvVo57vBxC
         MphJYNJIBvoU6VncsgNGgMOmciIyp0wMbwIv2/e9v7VdSlSAI6xVsfVPCcKNjUt8uslz
         9LF/DkLvme6qcsExdm8orhvd2YUYZjFuHoXO4vkhVV4PQUjKNxSRWjdN2f13ddlHgs6E
         HAOfwgWplDK3Wkyf+diWqKAXSuH2F6sXxzTVSqBA1HI6vos6FVKJ8UzIl7NGF2+6/kH3
         bJMg==
X-Gm-Message-State: AFuF++l0e/qucs9/2c1mijHkfdz9HMDwzUtavRrc4+8hjwXP3k62x1At
	XAMINMGNPlpDCV9dguRdlMccgx+7rS3eNvHZG+RWTavFL3RBplBKu4hPARTQ/uxjADgDta/5yW0
	z6TazS6DU/zBbpthQssGKLkbDVprEEGG7Xf1Lr1WjzBv5NvEtiTOGybA/OfYS8Y3hcnMx
X-Gm-Gg: AR+sD10tkA0gi8Om+Jepp8pm/GOf7EAU9kenfz61Ux2e8DJoMhLpfWX+8uh/nGA/Dwu
	IX3ITj8kkc8HVja7JOSDdOD5NOb5mlrQOK0KDYWHC6j4HXou1ta321gTqnN2oES/OW7H2WblJQ7
	MhZecU+T5EqSneFt6ChObuM2EQL7QjBkSw6kJZJelshKOAPnD5lv8Mlu4eUZ7ChvodXaYbOdnj8
	aIAObM0YAVvxDzzjQFcE9rxd0oMLv5XgRjEbYeRRU/80VPzYyxH3rxakWhJ3OnCQja5tp9LxhFD
	Lx5zmjgwJQuQf8gkYiSnfhAcxiAtwpBnA6FQPi4bpYUSVF218AGZT9BVhrHXPDXXjwhn/FH7pjS
	6luZgtkz50XzsMuzKXyi4aA==
X-Received: by 2002:a05:620a:370d:b0:931:23a:83ca with SMTP id af79cd13be357-93961007ae2mr421158385a.4.1788364451336;
        Wed, 02 Sep 2026 08:54:11 -0700 (PDT)
X-Received: by 2002:a05:620a:370d:b0:931:23a:83ca with SMTP id af79cd13be357-93961007ae2mr421112485a.4.1788364445998;
        Wed, 02 Sep 2026 08:54:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25cffc70easm158636066b.3.2026.09.02.08.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:54:05 -0700 (PDT)
Message-ID: <85f9ef02-e33f-4d61-9e9f-33d213a0c5e3@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 17:54:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/16] arm64: dts: qcom: x1-microsoft-denali: Mark the
 EC reset gpio as reserved
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett
 <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
 <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-14-f4ab7e4bb75d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-14-f4ab7e4bb75d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0MCBTYWx0ZWRfX8kmMkNtqRsjh
 ztOcYAM/4Gl+Q5pbZXKF5hfWYHMM8Vlsn/sI7qa/dGFL5Utew/VyqesBN1ZVGCF8H/PlQct9ppc
 gslTERpWBkV9SF0OHeA44hqaBn0X6Vlbavse3u1mbLHuz7VkOd3R3Na288/kQxdEcWryfmSkLpZ
 EYoQ3oYBWBWBiDyI8RvjtrTU1JwKnggqMdSVJNPPXft6cH6eH3Md23h4CgeZ2iUYgz8bSTa4kX3
 1xyih3aNvfvlf8KVgQ8VHnBCQ/btkOMKyrVx0An3qDVDD9CpG8Pm78hAby+s7I2e5Pg0GzpeA9H
 NvjR+/94t8D1EJvWBpEthiclTXWRWFU/+QKwYW6+OYEiBXzx2O7U+RxbIYDDSr3BfUl9dq5WBsw
 g3eqae3b5q39WZ/XsBzx/X2At9/SQiGy0YTxU1Gx0KYClmaJr0/+u8SF7fm3HlCtY2Jr3Pu8wOk
 tnDqml2U2xgzxNbVPLg==
X-Proofpoint-ORIG-GUID: 0IjbGdWMH9tZM0V6seMRADAAYytpl5YK
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a9846a4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=9b4qEoD23obgxP77xDAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 0IjbGdWMH9tZM0V6seMRADAAYytpl5YK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0MCBTYWx0ZWRfX5+wb0DO9T9sf
 KT4nvgxP/n/dtIyCbJWbTFqLPhV898zHonPALttQHAoZ79cUENyJFaObMmsVfihY2qLr6fi0+Yx
 9rn/OsFTBhLgvWq5ZhMaWMkZJteMEQ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020140

On 9/1/26 10:07 AM, Abel Vesa wrote:
> GPIO 65 from TLMM is used by the embedded controller as its reset line.
> 
> On some devices, toggling the embedded controller reset line makes the
> device not power up at all, unless the battery is unplugged.
> 
> So reserve it in order to prevent Linux from requesting or
> reconfiguring it.
> 
> Fixes: 0d72ccaa1e84 ("arm64: dts: qcom: Add support for X1-based Surface Pro 11")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
> index ce7d958ca687..ef2684e23a09 100644
> --- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
> @@ -1109,6 +1109,7 @@ right_spkr: speaker@0,1 {
>  
>  &tlmm {
>  	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
> +			       <65 1>, /* EC reset */

Because it uses the same EC as Romulus, I would guesstimate this
isn't right for this device too

Konrad
