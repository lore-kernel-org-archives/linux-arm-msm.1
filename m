Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374B742047A
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 10:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345751; cv=none; b=BeOVW9TwgpqtDaDts2sp5bWyHi+wTyYld6scaGnYRAJSpas0XYlJjEGqgnPD1Xy4hct3ymeIK8KwW29U8YxqopfB4q4AGQRIKHfIfejJlVzWjZO30v6le36cvBqPvWrKbcftabHVDzrtBiaFouY92Fk6iZ+8N0XqqHAeFDzRKrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345751; c=relaxed/simple;
	bh=v+f50awr0OZ88U1G2v97y6c01J5BI6TU2HpExBJ0wcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VHsHEj0b1QOm/TJmyxJTc8uzDwR01/Uqzuw/ZVDxJJV3JZekNyk7fQa61Muw8/iXNNxufmUVBL2cdu2r8IDSSmNbOJ+Esxyyf/GLbzcM/+qMAcsEWflHIt56x/RVe/jUFoZ3kXQw29FOK9ZmNUhff43nWxY2qV204wH8bkLFqSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PaYcDduk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IuMcHDN0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PaYcDduk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IuMcHDN0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NSY31349253
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 10:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hYnQe34KhevnSS7u4RCPgQ3k+Cl6PwnRX6FcYBLfRUA=; b=PaYcDduki1gBueqR
	igOujD2fG2GonUhNJfHusEMnYKZUWfVzoCm+OXuxB6nWOzQr7IB1mN8ADGWkf5BH
	y0aEx6vJ5nSSJQqK5/ZOHLiJnV0ePNnrtF77hhx0bfrxHyljLXKDHoxayBf6xAlq
	gJAN8sIKG8ph++pdfVThh08gyCvTBaLaKoDI1hVrdDd5ii0pF4DCz0812e/k5j4y
	d12XuHtZu1OgpKEk4oo1gBCBcF8Rft2ei+mYxok2VBwClQGglWFmI29y96M1/WML
	AGPf+WcHkJ0lfr7WWQJwWHgbcgQrBb7+H48yUsvAZrp+BIGEMjFGqrZf9Q2ZLkZM
	kmSERw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge3n0ug0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 10:42:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93495488976so22978785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 03:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788345746; x=1788950546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hYnQe34KhevnSS7u4RCPgQ3k+Cl6PwnRX6FcYBLfRUA=;
        b=IuMcHDN0lL21hZ2xHWUVZEynHyN7aAWp3jjpBVlXiJdAunElqj2KDq1ACDOtIBzBlb
         rHZaOUFv5ThNpbhEvjTaBPrsgQmx2KbVUMMAl0D/48dwsG96d2WmQI3D65/FzLVX/fX3
         r4ExQ8GfQNW+isfMIiXxaVLjHv71eKWGJHHCpqJdVMv4+oYJ81n24mQV3bCfdLWER9si
         m8+NaPjysajxq5cj8ijl3TvKqnE9mRTQuqw/iumcSN2eg8XPMDFMv7PXH9KZnkNNyqaY
         rQFNFCQcfXtpNWn7Q8X0+5a0XEGVYwM9MOw/HPOx5/ugNj/uW1SqSSCg8w5N28nYwjNT
         al3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345746; x=1788950546;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYnQe34KhevnSS7u4RCPgQ3k+Cl6PwnRX6FcYBLfRUA=;
        b=SZt/tFujH9u1S/zqHRjl0r1/gbrBsh5Bmn6OuiSHFqF1feEmgUHc7JW5n6XHB5dMBl
         UF1udp/zkeAoID/3xtzlJZn0lopM8nIjFTHDEbd+YL+pP+VeWNtoTqsO4mE3Cknjot/N
         iJ3VUwDF1/MBxhD2JJVrp0FAQEChGgmObHE3VwpvrmU9j9MJrzUVNje0j6ZOX0aJJqHR
         eqChptU7ZwykWH0dKUkDPTwgoy9x4u9+A3msRf9wOTjzeoE87ubTBoyMipaYQEvCYQKP
         6m5uaOBqdsa5DjU0YAGIkLlJDWCd7iGVSYjAhiNBYftD9iR6a6+NNz9sgqvJ39/AuHvW
         rSGw==
X-Gm-Message-State: AFuF++mWyYHzR8v7zyOk8Mn2Ah9RlZhwjaZmKm7oJvGbfM3NWS8BKr5a
	r3FEZwaQj7hsLispaYfrTJCbW6qT0Ou5hy6KjLjnvOoyVHF6xwgmA0G0NVRFllp9AvdCBLVfy7t
	9sUWfEzows83sDs+6QT7hQKz6TxgxvDEyc+4Y6FrlHifZOiiUj0UQ1yUTq+0TRA2xPrvu
X-Gm-Gg: AR+sD10N/fdQTjUniCiT90lS8FyuXa7TxdponTN/lx2dow3hoI4Q/5qpgdeSwiryU+b
	TIdJz6v0ppiWdyHes9gWemRfWuq6O5/qA2u8bQi23BptWKMTIgqXlL5cklbDwMDrdS0Qe15kIgF
	PWIL/IAsnl3MNnO3CzQo/sq534iOVGZOeo605mwrmEkaJJvBwZMHrG3qITL/Ldu/fGWAenAtiYh
	8dpCtMS5PBz3X+rCfcWTC88WYLejOPshz7mva8kzfoDrCAB6tdQrrkHoeXcfV4fJIjM85am/65C
	AfV5QU4bsBSzCfTwcDKH54pAq0jYfeZmqY1yD+OVz6pZoI+uuBqnEZ8rs3r20JDTjpVHfV8YIXK
	npv38WUuFVLH4gT7p5IPFEw==
X-Received: by 2002:a05:620a:400b:b0:939:46cb:25df with SMTP id af79cd13be357-939611000a9mr257850085a.6.1788345745889;
        Wed, 02 Sep 2026 03:42:25 -0700 (PDT)
X-Received: by 2002:a05:620a:400b:b0:939:46cb:25df with SMTP id af79cd13be357-939611000a9mr257847285a.6.1788345745514;
        Wed, 02 Sep 2026 03:42:25 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d0089a0asm111279566b.28.2026.09.02.03.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 03:42:24 -0700 (PDT)
Message-ID: <4a16a8ca-ab62-4248-a9c5-5362765ecd0b@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:42:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: ipq5018: Enable mdio0 for
 SoC-integrated EPHY
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260902-qcom_ipq5018_mdio_pinctrl-v3-0-629c7bb05c44@oss.qualcomm.com>
 <20260902-qcom_ipq5018_mdio_pinctrl-v3-2-629c7bb05c44@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260902-qcom_ipq5018_mdio_pinctrl-v3-2-629c7bb05c44@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5NCBTYWx0ZWRfXy34cmLDaUPo5
 +PCYNgtXBttX0CZwg8wfvPIxodtng+TDd3c0/I+79XS2pBn3MxsrGtu6nPpfgR/7PHaxnPSg3kW
 a6c9zFr7rqIg/LMtdT/gnwoXQcxEkJAN5PT9ydv4GmY+nvjo9BMfZdxCq2H5Cr61z5GDwFMB0d2
 sQvNXM8FysgtPKp+rMc1RNDDP0qogO1mSVNrWiTkZa0faijYBYlXkk7k2lDZ90Jf/MAS0r+UjD+
 PD7axWTI84kI1Z7qXsWXnROtwFlJ6tItIzQnn+PtmIx9avT6tMNExm8/8juz22l0/SkGSEj9wE7
 pxO3yfC8obaEEru/W4ktI6I95DgIPU+jucIDgts6ys52qWGqubtDNFBIr//wiAf9TBX1K9Y0zLv
 bCjFTqhHXJPSxCg44b8V8K5T+GW63xOx23PZmMO5DzfpGkEcl3vudQ8glMTREp+5JcAPEJFuugG
 aWqxoD7vh+4++3kUY6Q==
X-Proofpoint-GUID: w27BuM1yX8W7xZ3mQcsJf4VJLYcCA7YQ
X-Proofpoint-ORIG-GUID: w27BuM1yX8W7xZ3mQcsJf4VJLYcCA7YQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5NCBTYWx0ZWRfX9cgDYSrCcbVl
 m+b2F/8mdm0Ys3QzeWjan6iDOK8CkZDnpRo3aury5FEaq1YqWaZc4GGBcL5721SfK7QedoS4aw5
 onPeIs++05nf1eaXCu44uAV0i40xIy4=
X-Authority-Analysis: v=2.4 cv=R9oz39RX c=1 sm=1 tr=0 ts=6a97fd92 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Ey681UiW4vGkVYvG5ZoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020094

On 9/2/26 12:22 PM, Luo Jie wrote:
> mdio0 is the internal MDIO bus used to access the SoC-integrated
> EPHY (ge_phy), which is present on every IPQ5018 RDP board. Enable
> mdio0 with a 6.25MHz MDIO clock in the SoC dtsi so all boards can
> reach the EPHY, instead of enabling it per board.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
