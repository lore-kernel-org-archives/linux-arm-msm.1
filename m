Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460123A63EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787653523; cv=none; b=bMYXYZszVAecGt3sM6pzOJa3rJRlNmDPOIxRfdUyvEGQ+t6ywRZ4rab5pbPTuOU2f+DXV+3Ki3xWBvZ57FJJGvuszh1DcGonkfS+IMUN2AzUOwZQL4BXDC1G+D5uZkujTpzO75Th5nuC7OXg38fCccs5ng3zMcrOoq4+bIUve54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787653523; c=relaxed/simple;
	bh=d/RoLuRFayLi9UoBRJoBxc4vA8VoZRRtLYJcVqgyTbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ssxkoUue2PdHGBTuXiKYx7NMKru1VMYjslVmpywq1hF9oJglSTCaV3qCCT0aDdeTLojeYPDiYsbDUdFyhfJgnLE0eeYGTgZkYerwW2LUsBrsHLm2cx4hBcRs4rtw6XEfxWzhJFvpJUhlQO62uynn6BeZvdSrZvhNatBJDtQVq3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XJsM6pHG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LtUSjlBn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XJsM6pHG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LtUSjlBn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88MuA1706829
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	whpYNNZ3AyrGkoJfj4x42qutanZCF6mqPfJykpEIqQs=; b=XJsM6pHGBLhhfBXL
	nxgNMvcQWVe5VXe3nItYIONQ1ncv0esVuhBZQcdxVqobeXmZ6+jRAVOVPZveTTU+
	qyJCrrPO9jIjT+KdlhtQSYQctKxmb4RiSlrwf+O+/3tEa4kkQhn9g24+DFCe5kgz
	nk8KIghsFtXvV6AwRykdlvS1qg2lCe1IPSKl7qOwyuao8G5hwoGmmILlQ3BDabgM
	zJZU2mD4hUKgw3b6pG1MO8nO/oj+LigAjrE8zvK71EltbuK6ag3ye8tTJzu4EHtq
	aCVcMCjU5ZOJBcmK4rBfHyIkxb82TGRDpg2wz4TrN5wKY7Bnse1mchqlV++08a3s
	jGm7PQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93kvsesb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:25:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c9e97b626so8169541cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787653520; x=1788258320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=whpYNNZ3AyrGkoJfj4x42qutanZCF6mqPfJykpEIqQs=;
        b=LtUSjlBnq9djjjqaZF1j6hTldBKNp6sCz+/oYuY5a/6Y25m7D6oj83NMMalrWEgSvv
         XCNhMD/A0VDuIZK3FAyRQWp61Tr0uriNoEgKwZVJLpPA2unkxI+BCrpY0SO4S9EN28M2
         jnRmo3ZC26QnDvFq4PUgAPO6/sRNgEV9niHaPRPekz6Vs9I+auTBAak46kGFxkJ3/vhT
         vijYW6altgAIZ4CHJ4Kof44Wa447mDwawOJpfZVDrOd9Y4f6/w721nppYciUWKjO0Kex
         xZ6NioFmLA63bvqIOJVyjMGLBpwfNOy57pPQBJYCPEPk45/Wn+oFrJr2mHiqDISuGKAh
         guKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787653520; x=1788258320;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=whpYNNZ3AyrGkoJfj4x42qutanZCF6mqPfJykpEIqQs=;
        b=UVSF8c15jeYJvW96QbqUMvj8qjB3I2dIUWSs9dkM8alOJ6BWMmHLIFCxdyuC8lMcTN
         IkW0w8wKWy/m+zXM/S9bEdPGh7DWLAId+fa/4DHKXiYZS74sr4pjdjWzCP0R4un30IP7
         RD5WzmNv5PrAX+CTtuCyi1tQH0mZ2kEFiOZgZq7U+VwX0wfS7krGedyC77sj+6A5bVJh
         YaoCqq20H1kMH/HAk2AQTkP0V+LreAOUbH/3VcfzNtDAZcPHg7gx4BRGCB3e8h82bnFk
         tLQA/65n65OBeeopMz+EajkPX8PKCplvZMXFnL3BT5wfOCNyYqxhj2Slmbg3/XxJ/wiJ
         dq0g==
X-Forwarded-Encrypted: i=1; AHgh+Rpxj6ht81DpMWJFwgFjv3/T/uibmS9PclWlnMRWI56QwHKzFrVqwJBVvf9zDZeY/IRVVndrMZUS27ULex+p@vger.kernel.org
X-Gm-Message-State: AFuF++kgjbWeEBFDCGflQRewK6BErIbuyO/ruUXdOw9Jn19FVbQgY1EZ
	BIpEMdXWlk+ho7JznjsMbwJTwSM4Ksv5hnRA/UwYWwyXfHOLLehyDOSnREN74rKETfzlYWf89Ul
	+3cNLmqo1ymIKMpuxHz4ymyXpvJQdDi1+TW82CBKDS2BEKOpnbmVl2VQ1xxSdBnaSDuPG
X-Gm-Gg: AR+sD12kLccBGt6S+WAXAHwmeBeGP0XYHAL0eH3AEc1SgIzjYAeoYgbDPk0cbB12Iz2
	nAaOIfYkVO0AQyxgkx8pVSvENsdjl/vffdamL4JbWSzQud0VmjsvhaHkT4t2f0ETL6kIk4ftpD/
	1n5vhlzbeGpulnfiqCPChQzvS4ExhDMuDbEdJxKQjWgmitVYpGJ6n0TAKFXWa8ODdeHiw2cn3+c
	HXwLHWWsDrbxQd7WGbfJoX4ZM9PV+JrfiIwnD1JmzekGrMiaXY3pZb+E9I6z+D0LiAXVVNUuVic
	80fiwxsFguh6d6nI6fBVskOHqXCZkQQAHnsRcnucibNouJd8QzFRtqIfUQUFVG7c9NmGl/eKMsj
	Iw4iLC+2rZ/hXsENQ/OGyyode
X-Received: by 2002:a05:622a:1ba3:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52df567630bmr245367231cf.1.1787653520545;
        Tue, 25 Aug 2026 03:25:20 -0700 (PDT)
X-Received: by 2002:a05:622a:1ba3:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52df567630bmr245366941cf.1.1787653520087;
        Tue, 25 Aug 2026 03:25:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1770215866b.17.2026.08.25.03.25.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 03:25:19 -0700 (PDT)
Message-ID: <d0360954-4811-40d9-bc01-b5061cf615fc@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 12:25:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: Add Retroid Pocket 6
To: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260820-rp-qcs8550-v2-0-d4ce78fe9385@gmail.com>
 <20260820-rp-qcs8550-v2-3-d4ce78fe9385@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-rp-qcs8550-v2-3-d4ce78fe9385@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4NyBTYWx0ZWRfXxZptOnzCDSk/
 vEucczCmP5dP8RSSfTlRbH9MB9oQ3Ef28XNlprjNP/B7GjuykW0YJs2XFmsBV0WS+89L2UzXEbI
 Vhf6kU7ostPQbU5EX1zYsnDr2/A6sxT4mEUQ9krex7G6Td0kBNRrVyPYMw582QetCsnOoo0bnBW
 pArIGYtO0lxgQErjb6SdygFT++6ze1j5HjP1XmUH9h9OSPCaNXqI8t4hU1523Xex+I7zYtT52HQ
 EBcYNcxzTkV1KBVuz0XXAidxNBsawSib3+2w5khYBrs9FYLFD46B54Sr1sWaIY8apXdyp0NIdgP
 cAI+cO6VmzGtfjpWLZU4rnhq+b+Lrb9joqb2Hfjx1vC6pKPnNCd1+fiAJnLPtfarCgPQCwz8aCl
 m6VLyK9Rm9FGmuEE7sVHWO7uQYhy2zDjfKJbS9Gcvif59hIrPcH9ww9M6lPq4g9a+lbkKpQaFBD
 0um7S/2qd4M4iaHzk4g==
X-Authority-Analysis: v=2.4 cv=aPHAb79m c=1 sm=1 tr=0 ts=6a8d6d91 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=blwB5C5By4wrLRVlGroA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4NyBTYWx0ZWRfX/IBuGKq2ySMk
 erFenBc8KgsBveeigOjQtkzMGl7rUG0QLABGCv4iBoiPrwL2uuffkeMH861he1EmHFapR7hDl8a
 OV3ZxjoTS7LvEIE1IkLLIZViSX95MUY=
X-Proofpoint-ORIG-GUID: v8pm5JAQ0QJ-15sYA8aeJUxG_c9t8N5O
X-Proofpoint-GUID: v8pm5JAQ0QJ-15sYA8aeJUxG_c9t8N5O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250087

On 8/21/26 5:30 AM, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> The Retroid Pocket 6 is a high-performance Android-based handheld gaming
> console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring a
> 5.5-inch AMOLED touchscreen.

[...]

> +&{/} {
> +	model = "Retroid Pocket 6";
> +	compatible = "retroidpocket,rp6", "qcom,qcs8550", "qcom,sm8550";
> +
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pmk8550_pwm 0 860000>;
> +		brightness-levels = <1023 0>;
> +		num-interpolated-steps = <1023>;
> +		default-brightness-level = <600>;
> +		power-supply = <&vph_pwr>;
> +		enable-gpios = <&pmk8550_gpios 5 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&pwm_backlight_default>;
> +		pinctrl-names = "default";
> +
> +		status = "okay";

Nodes are enabled by default unless explicitly disabled

Konrad
