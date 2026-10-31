Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793442020;
	b=ypS3o/3GXzdCs1SnArAuwLj4HoOI+e0cwRZybo/Kr+EHqeyFkxIIPguBtW1tbPQvK7qR
	 +tEYb+Aa/ZhGb7WrnhL15m/NFWJ3359895aHYSBtL1fC9TE5jEaQ10dZmEJ0fz7DFZ9ky
	 gHSqtFG462CxCPFXpqeWKtOJVc/mjxvUh0EhyJkWKepKODr8BOCFw7rEADQmU2V+Za7RG
	 matkEAPtjvSS1DSfC11zXWwedok3OKfBC3TizT8vhMWlLCQ5lU+SEqPm+iUVzVNB+ob80
	 wvIss5H/DQem99dOXfkmZWW1Yoj7Y7HwpwV+cFDAZqyFqaHblRllrdoL+M0ZrWyvsqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793442020;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9Yms5QVe+i+O00RDca7nXtw0qBRN64RH9+LuNvzv8KY=;
	b=MJ5tJFm7Xzds+kZpD/i6RIjSnHQc5134wdrbTdx781Mu7bHiIxf3BC1ofagNGF/MzmrT
	 didksG8HvGFLqKqG5E8mTqscbAcOu1BIV3gjOtTFY3mJ9uCkc+AThaFBWD94G+wV9kchd
	 kDJFkScnWoGTZWqzeJ2Do3wQFD/RtyqvpgCzup/+IAXfdOUDgtFbMirrik5XYSXNcilB3
	 4cujR0qXklaIS2DAO3zq9YcsWej+m6uJO/Hm0pcwkwFuITvENdEaOxIhsVsdEx8ZylLsf
	 +GPELhJZwz+ZzDjbAjqi7ftyyE45rZ2Zttu+PH1Ba/QEG3Efp2rB7hDMCo651m6SiQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nND2hnLI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AG610c05;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDAE606A31A
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 10:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CDAE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nND2hnLI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AG610c05
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4aw4V2178210
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 10:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Yms5QVe+i+O00RDca7nXtw0qBRN64RH9+LuNvzv8KY=; b=nND2hnLI1zEmWaL2
	vU3AomLNPXjNN1HorhEpnxVZSJIFfQTsdEw8Ld6+Hri78d95Q7MWpxSsTkAGhJIN
	3jdn/xFqzWggkAJvnHlKZUuFOXQiwS/uCiB2W/uoZCHy0kaKvUv6jS/Ti+z9HRpF
	Ri1S7DxwoOocwKPtD8C7X2A+lCvhIt5LhlpDPhS4g0i/paIdHxugc+tzoG1TBM3a
	hbRYViQwhA1x6J2L4Dt2E/mHgLsVnwUqRhYQ/EzWmeBtfRhWniC7xWtZGCWP1dqm
	zEJDR9EZtonG1p50YgAZpqNMPa1MYRsM067TKa4U/YkwKLlc4V3RYtz2V93rrMIz
	TVWhrA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rs0x2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 10:20:18 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a26fe9521so2445807eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 03:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793442018; x=1794046818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Yms5QVe+i+O00RDca7nXtw0qBRN64RH9+LuNvzv8KY=;
        b=AG610c05GoT18y5MVWA+416UeTPBEFN3OgMRRLYAB6MFujaGqfdT3NwXouRmkzXVP9
         bix96VeOztuEOA1VJyM9xvD08nZcpcxG5BL1L9MI4QQiTdN8O73ILzyqF+Wkf9GamE21
         xvbD06+yO7w2owpUJ9E85CTgSlxrTgfDfAFmhquaLAP8X3PrZ0AoR13J8wc8oQUxPNIq
         D3zKAy8mvJCu7f2qB3ubh7xro1A5LEaf5a9M5jfJaoG0jQUQTRXPZgHJk0AYw4C0xoDp
         7DG4iO74ctJVj98Ntps3vSKpBynYdINm8Djk5kBw4JMsUZZIv81cklgHnlvYIFBpo5W4
         mWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793442018; x=1794046818;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Yms5QVe+i+O00RDca7nXtw0qBRN64RH9+LuNvzv8KY=;
        b=1tKSE02++QhWCqKjssmL31seJCUK0GBI/x8FosuKwweRxIVm+pFf3QDo7QrG9Y++am
         XKcUl7dNAfbC1zbLlI3aFmy4LvmValgdfMWuJz72G+9gEY/rdbT2nnBludaykPb+369d
         IymNlmMUKkBpWfwISZHJG4ztCRsExwcpfEKBcoiQdA7z7tmLbYzkB4vwoA2zvA7sJHHg
         7m2qGvxIodx4+Y5t5x+cRUQLqKsD64HiF5XGbu6UDjCJM/7IRfIOvmv2QpiAxI6PbRHH
         mOWLaq5ggptrJrAbglipiJeHVJbJj/4SDc/qWPYFrIQ3vq+L3cw/ntkZ9cKZQWi+Sc7n
         0zgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOTojOolpoROOzkaRZOWeknpPCSjffxd2vn7IZf4aQnomZOHT0hI7euVILCWq0+JokumyGiQEpSLYCYrU2@vger.kernel.org
X-Gm-Message-State: AFq9FYKfI+NIYBQJgIlQDja+Z67M21j/avtEinwQYk3ZH68yRcFIXWoe
	B9zFTs2yLaBnncNmnN3ZLs7gSY17fbpe0Bo1v7hBAviPv9U0FOhVU7NOB/IuvDDHXmX3Ug64AOE
	Mv60CL4a/fCP/NbaOCp+Tcx02xKpJ2SpuhQUrjoBFUsJd0UCKYNmVHxZPWobIhwT9gauX
X-Gm-Gg: AYBFou3/y+O4o9tkL/z68QK+NNOf0jit/5qy6HlNGQiHchWDbmB4VckxVoR8+9NRmaV
	+41AbtU9yzp9hNtZRwDCstUoiEuVKb8f3g15EKidB33K/rn3Ithfe17IwSR/2bPY2HAVYmlFIXE
	YAIznWI/e0ReEFJBOSosyg46b2XF5bfIGW7mEStNfoq7eB+cKgzgLsMg4JkkfSWpa9W1ivd5saw
	8chG0VwSKSBrSE5RcJrEJ4EAS8zcIHNsXIr3SqQS1AXT+pmSx8gDYMh2C5s0ECPkCHizJYuXv4r
	QpIK+oVy19gOJ93Uh8DqCYLvgGp66Xv/9X+bXCcpHFhhZn9uxpzoBn9iXW2Us0THQbpkR/cGJuW
	rRKIqsMmZx1s6LcWz7LUYhSOtLnVCmNRYanPnNJi8kra67EfXyY65EsTtjXWFIILhh0p9EXbE8g
	aAfOtr2YE=
X-Received: by 2002:a05:701b:4549:20b0:143:1bb1:3305 with SMTP id a92af1059eb24-1a94abded94mr10345548c88.22.1793442017542;
        Sat, 31 Oct 2026 03:20:17 -0700 (PDT)
X-Received: by 2002:a05:701b:4549:20b0:143:1bb1:3305 with SMTP id a92af1059eb24-1a94abded94mr10345519c88.22.1793442016955;
        Sat, 31 Oct 2026 03:20:16 -0700 (PDT)
Received: from [192.168.29.63] ([49.43.230.158])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm16523200c88.16.2026.10.31.03.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 03:20:16 -0700 (PDT)
Message-ID: <cb4e821d-a2e7-4ca7-be1d-f92e20e52260@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 15:50:09 +0530
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
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH RFC v3 3/5] arm64: dts: qcom: nord-ride-embedded: Enable
 PCIe controllers and PHY
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
 <20261021022921.2053957-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261021022921.2053957-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NHOWSpP-T3tLUPZmeqWIaVwlGcuXg-ow
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae5c0e2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=16YkeKhe4TlTIPRGKl4Ycg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=GcTTplM3uHFL1Q-H_JYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA0MSBTYWx0ZWRfX4s4TS/oYK/sa
 pyC9l6ggibi5eSIlSVG23SjVXioYl8+48zpjOCTTRKriptDt2nU9Wri8Iri2k/fcqb11xfndhzm
 5Axh3E7OcPk8mxYb5KDJoG3pxVaHktw=
X-Proofpoint-GUID: NHOWSpP-T3tLUPZmeqWIaVwlGcuXg-ow
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA0MSBTYWx0ZWRfX8QJxQLVltej6
 9NS02vjN55yObRoWa8sN9WEKNLLisxwxDhBTVZiVcCEzgOJmj6h1gmX5QuP6uRJmvCw5kt7rSWd
 e/QgYSmcJIOSfNIfssbEUregpAPfsyvosaDyfyvcVedNUcDrzVDhmxo7C3BF205XilYl7NckBIf
 MduKwxNafRU0OEvfOO6AKLD5UCz14kjcw9xfRT7eHKPmXcjOjRcnSMZfJJFlyww5XLbWmjQyApT
 aVP0NRm6WWi/UmIGvGyJvlwfioYNMv2dAlQESZTUtqlXpCD7D8iTuRMPeCZ8huZ1lC9EH9wDABd
 4IZAuMhhenZpt67iKnZ/Fj4MroAxibrNNLvJww64KLI+PniyoeCkXIjygIhglowauDEFzrZwjBl
 2c98Wv7hokfnP4ha23F5WPDUP6EScYPYf8MVbBA1MB8LW4oQuIwFxFiyMtb4ci/rSKcPDJKyZ61
 6I7WpRDymxk/Q/QPJOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310041



On 10/21/2026 7:59 AM, Shawn Guo wrote:
> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>
> The Nord Ride Embedded board routes all four PCIe links, so enable
> pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL rails, and
> describe the PERST# and WAKE# lines of each root port.
>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/nord-ride-embedded.dts      | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> index 49635695f832..fcc07226db8b 100644
> --- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> @@ -366,6 +366,55 @@ vreg_l3l_1p8: ldo3 {
>  	};
>  };
>  
> +&pcie_phy {
> +	vdda-phy-a-supply = <&vreg_l6a_1p2>;
> +	vdda-phy-b-supply = <&vreg_l4a_1p2>;
> +	vdda-phy-c-supply = <&vreg_l4a_1p2>;
> +	vdda-phy-d-supply = <&vreg_l4a_1p2>;
> +	vdda-pll-a-supply = <&vreg_l1e_0p9>;
Hi Shawn,

I did a mistake while sharing these changes, pll supply for b, c, d should be
l2e instead of l1e.
-    vdda-pll-b-supply = <&vreg_l1e_0p9>;
-    vdda-pll-c-supply = <&vreg_l1e_0p9>;
-    vdda-pll-d-supply = <&vreg_l1e_0p9>;
+    vdda-pll-b-supply = <&vreg_l2e_0p9>;
+    vdda-pll-c-supply = <&vreg_l2e_0p9>;
+    vdda-pll-d-supply = <&vreg_l2e_0p9>;

Can you update them as this patch is not applied yet.

- Krishna Chaitanya.
> +	vdda-pll-b-supply = <&vreg_l1e_0p9>;
> +	vdda-pll-c-supply = <&vreg_l1e_0p9>;
> +	vdda-pll-d-supply = <&vreg_l1e_0p9>;
> +
> +	status = "okay";
> +};
> +
> +&pcie0 {
> +	status = "okay";
> +};
> +
> +&pcie0_port0 {
> +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
> +};
> +
> +&pcie1 {
> +	status = "okay";
> +};
> +
> +&pcie1_port0 {
> +	reset-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
> +};
> +
> +&pcie2 {
> +	status = "okay";
> +};
> +
> +&pcie2_port0 {
> +	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> +};
> +
> +&pcie3 {
> +	status = "okay";
> +};
> +
> +&pcie3_port0 {
> +	reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
> +};
> +
>  &qupv3_0 {
>  	firmware-name = "qcom/nord/qupv3fw.elf";
>  

