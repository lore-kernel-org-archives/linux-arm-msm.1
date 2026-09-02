Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D49A443E5E
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 10:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344669; cv=none; b=LddL1IUfDjSlhZgqVk7mUM48xt56hHDv2GytqRk85rPvneoIok/2BDHCnBqRUGwv2qtL67jhsBbD2J/0G/83YmBvietRJRwQNrSWEBtvsx/Giai/86US+7Egu5n2XekvBt04kfe0ab5Pm5w+EMZ/iuY0MP9JkBNc3IOdmHYc+bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344669; c=relaxed/simple;
	bh=iCb8yX7RPhl+yn5F/5/P8HVWlsw7cIAmXa/n6DkPaD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hdeLD8WMFCz0VdzJx44cnx6uNzOK36cmwbc9we/+MbnFQjujAqrrc1JhcYiyzri+xR9YFbhaMv9O99iYko/uFj/lYcpvDQNLivV2J2UOe75v9b49W6zi4KhIALYbYYYbc05RKnKR94ZlpnIqLGUx7y7HsRCAC6oMhyLWtnG29G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDnQO6IP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SEUuAyG+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDnQO6IP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SEUuAyG+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829N3SO1080189
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 10:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EXTLbvkaIocNmvnJYqZPtiPMWVNU4SP5kdw8z+YoAD0=; b=EDnQO6IP+tQp0z5Q
	zGMt5ErvlK2OPTNxWQUUox9ndmqg1TC+JrCBHxfla8b2h+CzcOmlpN7RuV2KneL7
	sCbV1L4w4W9TSQgSdHgqXUEiuzNXhxrqbwxzaovDZwe3e/zm+d+jwWHExJLEPX+1
	eqyIhKpVrcEMDarlbZaFPNRn0YAUbPwdz7MUb5FJV60WnPoVEARYX0h6XdE0lZYP
	5gEiuffia1E8E679nTgTKxiLMVxhdAPHPiV1ln0is8DV5PTQXjn6wMb886cXSs6r
	xzupbu2LX3c1LBXjRkmI9BrYy/I528B8GOfZz4pn/r3uKkwpzFcOvW//U4ak7GvF
	fWoLKA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geb561p0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 10:24:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e38fbc5so170941085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 03:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788344664; x=1788949464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EXTLbvkaIocNmvnJYqZPtiPMWVNU4SP5kdw8z+YoAD0=;
        b=SEUuAyG+FCP4HcoUqqX6SC1QviUTn4b0+nzhHkphugL+HY4706iy7jQkHizXAtzlr3
         vJnWt20bESRBwaORBhM3qKIvUGwuJGia1O2rmygDvw1xEaRucynTVw5q8k3OMt9Oa3yX
         1n5r0ewdHGduAbVFLMt/79Di7Exh2E6ugv9wyqv2LZCsc6igakpBG7NcqEsHtnGHN/yj
         fvZSu7DUD0e0H1bbPWDVX+hkSyGSFVqvG7C2VzrI0QZlkRUKDmG0w+TfvwaPN6PijGrG
         2Q+bKBtJoZ+/s/HKj3Ab/oSskYaDLNEqsb0yoC8gvEtHOk4HtDLqJxDvgcCMq81LyZin
         LG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344664; x=1788949464;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EXTLbvkaIocNmvnJYqZPtiPMWVNU4SP5kdw8z+YoAD0=;
        b=rfqaw4B+GJ5j2tgTXAUnfPOgsqe/ybAKxtuxNgoCrCD0vTUEAvGs31BD5us0FVgZTb
         NOh0of8Vt3FAy0BO7m7FHYcC1X05jJd2zr3jf/YIy5gDNdmfLCxR4mHYNu+DjJxrUQNe
         SoeNb8DK6IVHYXZrjT7h3VkYbY3l63cTiC3ouiHXC5syremh0glu64/PalDmDA9C/tBO
         N/Rx+grB/m4zJ+pxQpaJtGGzvHDjY+It1Yue/CTtpRdrEhppz8xmgKBe/AhAFD99DcZ4
         p7P3692A0y9dWSbfsXXzb5ttbwhNnvqBTJgTFlNmTWFav/lFxwBv1gUvG3n1/Y9dVxfA
         TclQ==
X-Forwarded-Encrypted: i=1; AHgh+RoekZsbFYd19KxhB2PWQOIbCYkag0Fl3FzJAg5d54Om6iFSA1ZosBMChyHQCOgsK/SDO9OcpUWnE5af+23G@vger.kernel.org
X-Gm-Message-State: AFuF++nqTjplF51dfa7MOQQWXjCcTQ/DXghLUHfUT9pK1qUlaEu1vKnj
	GnAcxGI3l6LZM3iBJsfu18kjPq8KcTIk8NJGSbYLa6rX8RgXwtAFILPDxLU7GVTQxSNkegtjcHG
	Is/nnRjXIVPtJYb+MSPGjgH2+n6eAnhjmitaHGqkN8oQlGKm0WUh741KM+f/XZrefZ7LV
X-Gm-Gg: AR+sD1289ckBXxDq4AH4qt6JwFHb3hEx0sTrcowDOM9xO7IHdMBQezYYBIoXseXNEuf
	QPkZ+ilp3VTfh0VtnkzwYaPJ+kluLmzUW7qjEUOelmq/9y+xQI+exWoRJxAZS7FysJ35/57JxlK
	SytIu0ApRk4sFUqfSwmzfvSvXdxlC+i45txOW9rS8eYD0+rLj9OABjVIhZzu/RXwFr+rEO/+2qe
	ZEBR1HHKZ9HjrR/pTlGWJr7dIOs0B1KFNkmJXVYQ+GK7/RqIpkxBOBNhPD32jqZQNtAEYPIMCIT
	dMdKOuATEj2GkUcMtCjI9TNL+GsDJ9eclbK2Ngv/lR4ZgxB4xYmZfquXFIex5bcNN+FpDb9Qa4r
	0O00TQUJxsfGx0LFcRNrO9Zg8nsY=
X-Received: by 2002:a05:620a:a0cd:20b0:934:aa56:45df with SMTP id af79cd13be357-93960df450fmr373921685a.11.1788344663533;
        Wed, 02 Sep 2026 03:24:23 -0700 (PDT)
X-Received: by 2002:a05:620a:a0cd:20b0:934:aa56:45df with SMTP id af79cd13be357-93960df450fmr373916685a.11.1788344663027;
        Wed, 02 Sep 2026 03:24:23 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b759:bed7:f8b6:ccad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce3e04csm132554105e9.10.2026.09.02.03.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:24:21 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: qcom: Add PMAU0102 GPIO support
Date: Wed,  2 Sep 2026 12:24:20 +0200
Message-ID: <178834465640.12889.17588552466171610581.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260830042939.144376-1-shengchao.guo@oss.qualcomm.com>
References: <20260830042939.144376-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfX8NVNzbm2G2Rv
 +izc68/ZVlXFGXe6OZZLX1Q7W5M0TT04o8wY8Rg2G+Stnxj1FkJMC3zImWnUhLgGgaJl5PtvEdo
 2pQ9JA4sD2Zo42yX/gsTsDBkh9j97PPyTsfv8HfoU4EAVJ421gi2gFfpl84Q605AicYpRn+Uq0A
 5AYpx6sfqabG/TCzdE8fvVIAJKUDQlEQjutU8vppmk/dAixPIHKMx2rB/RuEuBYf2mRxrmsEK90
 5oXK+c+I/9aUE4BL9rYrDXQRKSbBZ6ktyHwbP3PcoWQlnyoySoNkNrLxly+NwlfjkAO0zWQBG1T
 I1g3Tio+xB/sNSu/xyNFlZiHstbLNhBq1vBaBCKbvEnQx/Y0kEr6O/BAq5ykZENTP7Rm6h6fqgl
 MzYkCd1AzmOf2efpIDSEIVY0zPIQJeIn/ByyLTocy3p3rEPl1jpIE6thdDIdMknek3Xi6XcrMGC
 SazsiErjNepZg0xPTPg==
X-Proofpoint-GUID: RYC8EF1iPUhNPwwvjTH-iAxML4jILee3
X-Authority-Analysis: v=2.4 cv=D8N37PRj c=1 sm=1 tr=0 ts=6a97f958 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WFjrMyYTNELkhRd79CkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: RYC8EF1iPUhNPwwvjTH-iAxML4jILee3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfX/da5g9u5XXOL
 PwJMHeRNdbkSuO1lV857LmeCSd8Xe3GK8ntWKNB2k0EDe4FCov+U4daSTf8n1S/JaAbBHb5RxpD
 rS/1LwOTxlVbxtZ0CJQgGPpjwJIRxp8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020091


On Sun, 30 Aug 2026 12:29:37 +0800, Shawn Guo wrote:
> PMAU0102 is a new PMIC used on the Qualcomm Nord platform. It exposes
> a 12-GPIO block that is compatible with the existing SPMI PMIC GPIO
> programming model, so support amounts to documenting and registering
> a new compatible string.
> 
> Dhruvin Rajpura (2):
>   dt-bindings: pinctrl: qcom,pmic-gpio: Document PMAU0102 GPIO support
>   pinctrl: qcom: spmi-gpio: Add PMAU0102 GPIO support
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: pinctrl: qcom,pmic-gpio: Document PMAU0102 GPIO support
      https://git.kernel.org/brgl/c/25f42a33ecf914e6d8da6eed2cdf7ad86c9a904b
[2/2] pinctrl: qcom: spmi-gpio: Add PMAU0102 GPIO support
      https://git.kernel.org/brgl/c/1cc8b87bd9719f5c496d27a1b4d2892947ba70d5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
