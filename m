Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468935013CF
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902535; cv=none; b=KLcRB8+0MqZoiw0Zqh5e8YxkUIgPaYwQrvEgZ1OW05yxiXqfrvZ7Ap6+0dxMsxCrBDaL4OaGQqXbaQOS6soyj0Ztv8Fr4VQ6honXvRu9yRTkIQrJE4DrHdQhGRMxpciyGB5OZYnb9XFwjwADffcUBWEAqo/6WgtbPPURWgBhMXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902535; c=relaxed/simple;
	bh=YBYSS2cd/vhZqe7h/46qa/l9XVlkWJDuAu6ViM8rvnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GJ8sMw5yPiCpxXyDMgR7RRs5S5OFEI2AVepjuyxGqK8xGUyvqYL5kOUhPq50y6VCvY0qmcoM9h7pafIJj+jFn4Q0WcBbBiMsa7CHpwot2pqMwFIP6r+wMEJ56ozHkN337fzPhBFDMPtRu4y2ahMc3nRZNqYZxZHJ69NMpkTNdBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GGqyOr6D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLu+cpwq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GGqyOr6D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WLu+cpwq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE3ful1143647
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3BNPrEtNqmXapnqW1Au8jUfClwKMM3TcPaX6dJBusUA=; b=GGqyOr6DX0K53ryu
	8eVDL9ontaGI5R8PeyTscxhgfLw3JQI0lwc13nTNjAfJ6hLe3xofLy9GMThSlD22
	KXUd8Hva0WYkRKNKreobmVR6ae/MdSc0BorMBRpSYxR5s+UmdBMQEwQR23zPWmXK
	bbmnRTct1/zmEYcgHf7jLOyKX41yX2NI9lTl9X/eqi/wpnNVUJJGWEGssW2EArzI
	WNDi5ivnUnxn8vyxcOWqcY1nMpqLJgzt8THJHxji9jaaK3AWW4EcsUSZ4jFwsFb1
	H6S9tlVqWuAGNwTTB+7wK9w481uE1DQgRB23a+c2w+VPAPIxOUK3zTA99ttN7zY0
	J+58ng==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hpg9dsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:42:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e58614290so18014185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 07:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791902533; x=1792507333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3BNPrEtNqmXapnqW1Au8jUfClwKMM3TcPaX6dJBusUA=;
        b=WLu+cpwqazCCZLM8w6VE82W4jd/oKgaHliTJSCmFCT+2JeewpqlIx74ceh7VYY9+SP
         Q3ZIXjkjgasFgTqmmxvmfT292QCgWSkHPxN3L0gXhkZhRKn3wrMYldFcq+XpAAcz1FOh
         VEjF6AdTcAc8MKb/7oaowexNdxIi+0saVSBobRkZLVwDpgF3vjhZRYFc4Okd5IHffXx3
         Bn4duKTKquM8SkfaXAuQDuEIixTCtkTJbw9TjiR1HIf3gdOU/wgeKafVeCLcpK/GKEox
         bD7Dh8o9Zd9DptdKxA51F0On/d69VzvMqAZ1SKzfq5RwdwZ66czpO4cy1xwshi5jppi2
         quag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902533; x=1792507333;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3BNPrEtNqmXapnqW1Au8jUfClwKMM3TcPaX6dJBusUA=;
        b=em6Cmh2nRFeACZyUIJf6vLr4v3UWhib+1XScXYz0Kir2S4CJxKY7x8g2mRawqWVPlL
         cXgCmE0YLMGjJvShiBbktUXLkW6EdalOeuUlRU2JK8G6934HYTeUmhtEoJ/sAa9GrQ+9
         tZM1VjuRtnrfqItg2LqPT33YxaZ7rHCD3sCLmAxajaigHYVIzrYrn0vDpP2c/A+6dLFk
         tl6ff+MX1i6ukgQgfAPIFUBr08T8EhT/WM6wH/jJVetHybZoJogR2atTkmGW3E6nYd9k
         EuF5ZnpXflJszDT+/PghV3KLmmncbbZuAGq1dbM+SQZWbVygRK1c4UhMQgtY4rdz2YrT
         t6lA==
X-Gm-Message-State: AFq9FYKCr+tbhMBg70meLiaAJvoniW88IOn2xq/rT8Ju2cxbkWXfkZyL
	vV8vKthalNkXpmtcniJTd2ogDXS6ufYBVBYylbYCBOy4SfnQNgVNzyWjs00bGCUVlirNpDmHZ/h
	OiO2mOhQKZRFJgRNd0CByr38o9AnHv62m01CvE4yjdaQjkjUPi56en8hRaNMvG3xQLLGM
X-Gm-Gg: AYBFou3Y5OaQMNrN5r3E/WdMRKYE8qM11lWbmxTtToSMHUdlRae66guf+JBpuTpaxkd
	InFO2twFABG8mwRYfiZx3MdERCJPfciJVMC51GkTAtlOM7cLBpBTXedAqycIZVFYBt7IsLCi/+f
	yh6ZWqvXkeAVcMbC52xq73KuRkgioGXH6zX9z0RohaXbcOZFKXepprVYu/O33foNQv8/iHmMYTD
	CDB9Slu0TsiTrkTlNF8iD+7/pOlx9T6UIyPqEOH/BCIn+dyJrGJdQF6ncDRlXMiFn2KnsKbK+li
	CBpXew1JUO2+4TqWdmBRg83l0dPjt+IXyw8NGOqhdRNEdoQaBYxZ1ZbacOq4QfWPxUJrFIPrtox
	6B38vqP8wYPpRcWAEv1K7uA==
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr2402375285a.4.1791902532452;
        Tue, 13 Oct 2026 07:42:12 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr2402371685a.4.1791902532015;
        Tue, 13 Oct 2026 07:42:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a74c48sm600297766b.43.2026.10.13.07.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:42:10 -0700 (PDT)
Message-ID: <3201a0e8-1d48-4db9-af64-50f61827cc54@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:42:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/11] arm64: dts: qcom: ipq5210: Add support for WPS
 button
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-4-77bd3d68d850@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-4-77bd3d68d850@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wrT945IZ8UnhGv-Tal0u1Jb-9hP5AKEN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfXyTryF0KCfQ/L
 XRocwNg9E35Zro3zfLd7sKVv2MFTkNSny+vsSgfK1YQ3yQOwa5yGB/49hwaFpwyQp+ZCmx2B3sE
 JSaA2tDO27EspBdZ8FoSN4MreJnFeGg=
X-Proofpoint-ORIG-GUID: wrT945IZ8UnhGv-Tal0u1Jb-9hP5AKEN
X-Authority-Analysis: v=2.4 cv=Z4Z5j3RA c=1 sm=1 tr=0 ts=6ace4345 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Zxf1fr6QNQWzRTqytMkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX5RIaAZjU7PjX
 bc6IfgFnoVnwXKrpYJ+HLQWSKgStZAmkBTW3bUljL/2wAua457ZXnAo959PKLO+wA+2IXbVTS1j
 n6peRbXinJCkPLRzugSVa93ZM1sbL8XIE4Inv7laGP+hsG+/auflBUyt+E75FpruN67+kXux+lY
 Dvn0i4Rtpgz3Tf6AXq8lAAwF8Tr/y9Xw85ippk3oFqaQ3OyDFyHwTRZg4j16QKZJi1WwF5ssp8G
 12V+fiyHW+YL8z5cY8j6qJezt3/gLLufbaqeUqyNSitSznDlh6DLG/i/DCf0vncRkTcIbljfJYW
 81dQtwTcaKjvQecL8NnEzpBBMgLAc50YaaHQOGp2olMKmpOlamYuO6kTn4IuBo/lEN6Zvf6l3rE
 jYb2w3yjHpm8r29QwilgLUXS+iS2xhYudW6TxGM4vYDq2p1OXUg04qmqaZNkn5dERFJ54G0g9vS
 K3kYDa6WSEwHPJzMX3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130058

On 10/12/26 9:23 AM, Varadarajan Narayanan wrote:
> Add GPIO related nodes to enable WPS (Wi-Fi Protected Setup) in IPQ5210
> based RDPs.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
> index 67f62c1acddb..7f90a2632b07 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
> @@ -6,6 +6,7 @@
>  /dts-v1/;
>  
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
>  #include "ipq5210.dtsi"
>  
>  / {
> @@ -17,6 +18,19 @@ chosen {
>  		stdout-path = "serial0";
>  	};
>  
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-0 = <&gpio_keys_default>;
> +		pinctrl-names = "default";
> +
> +		button-wps {
> +			label = "wps";

"WPS", capital letters please

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
