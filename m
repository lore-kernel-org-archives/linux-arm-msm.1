Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005FC4908C9
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046974; cv=none; b=g5G7o0ElsL3lzOUlEZ/Kf/qQPN9aSYJ3bDrBZmauOYgKyxWRC8uWL8etGfsW5LbByLaa8iacBUCwdoaoYHt+AygtiyGjSigX4XRFQ5pr9KGFgu9wSv3ffuMFFSai4l27rjypG3ohQiDHNCDiCuhBKOOWsL1ibRMeUsVv+0sNi2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046974; c=relaxed/simple;
	bh=jIHPRpMEkaV9mAQmwuXnsCksTtsHuY/XKo46rkvTq0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ELe6QO5+9WrdZsNiTVeRBFXM6ica0GfyombozP+SVUHkB4aHyBEsrZ4X+xrVE4/+H1HgXE0NuMwM4fvy0n+/wn48CJnHMlf4zcw5K+OD+/g7H38qd/tA21AOKeN+dN6KFq8J5K1kwMDGLhHzwqPnCZfsOJxxFQcJ5GuKg/j0ycU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NA/TH8h+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rw7ZjGB1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NA/TH8h+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rw7ZjGB1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7ijE780826
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wTLzzh/gRKPHbedm5Fr3dn5OxXC/FCfqyO7/oiN+9Jw=; b=NA/TH8h+c/DLE8a4
	xGnSmCYUEd6z3PunvnqpgOHAg02N1ltooCTwuVLt1wIbiwbg5uW0e/BKUH1IQ23s
	mIAU6Pq4meOvKzILxnayNhZsi5ub2mcFERKgU1Q4X1HK2ii1kgzzHwd6G0FiR9FD
	QRETpj9jeDPk1by420NtcBuL0h9ptgxDpat7CpC8hNwLudEVfh0bIZr+ll7Z+SVt
	akDog+5+1NkckSYFb3hnwoaafAp/+fkrXU3GW4/+QXgJ5VtdmsMJbRftH6NRWLaU
	dzX7R7haLhZeEHN16LZwkMMKpHqWwxLNYfN42PjXnsMFnxTM1HnGzB4Yk2ffOO2N
	xI5Okg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrak9at5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:29:31 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6bdbda8d453so3621597eaf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789046971; x=1789651771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wTLzzh/gRKPHbedm5Fr3dn5OxXC/FCfqyO7/oiN+9Jw=;
        b=Rw7ZjGB1eQYgx+cZtfl02q6Cvu9MJNl/MvOihj2DIJlbPaUcMhPYuvBlJuAj/rBfFo
         THhT8e3A9FwiIXMbIhOiXjYOwT+M/tF8PV+fy4EDo3oecqxv3URzt9qzHFEbHegG9Pih
         8068RTrgxJ8RQCWz+1yOBPHATWwBR8WsZ6q4RYu9UmH3OWzQuEkpLHfnMg4eTHoG1X1P
         1uvDy2ob+FqDQg7zPoaRhcvgcK3R4354fB3ujGge+XeSdrg47j/kbp262CpifDhI9OLm
         PC/T/QzOEPgTUAlhEvdaMGiAJEmrFDytjhG/aK6SF3AVVUh+o36bdA1F7IVmHUNs5WnN
         1cTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046971; x=1789651771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wTLzzh/gRKPHbedm5Fr3dn5OxXC/FCfqyO7/oiN+9Jw=;
        b=JiSvv0sn8Ct9TaeS6TbG04D+8vXLXlXHT98RRsIBx9L1Zpui4+OZzl+1gwrbJlyxP6
         eGwgvRdLHNcskvb9sMfKHfE9HU5jbTsQaFf7gxBbylaFRDdMxSqLEJS2yTntoZ+yl8c5
         aWywVP/FQ8kKrmHXEl7XRkuJVoptjLqKmS6oxL0t+4/UyNzbP4J172TkfKhrcCQ6QF1u
         fsVX4iUORSTVafUIW5P9BtvJHrie/EdL4302RWjUBRIvIsDGbY6kpXlJZUyOowZdvSS4
         4t4ElksATnwxO7ImOFOnXC9CBqcB8pKdIgbSj8VBdNfyoAWaCzEfa0zjh7v5jPJKUfXK
         jE8Q==
X-Forwarded-Encrypted: i=1; AKwUvBysVW339A8q1HVD8F5DdXBtn+zIAu+FOx4Gm/sljOjhkaOosjwLWcvkpY6iympsS3mviM0JyxE9KTcc69xC@vger.kernel.org
X-Gm-Message-State: AFuF++k82ZmfEQjPZ2JgVNEOMyMlxhAQEWU/oEKCne3XTanbUdZo3+CY
	hCTk4Tsfp+/0PRqgy83ENVKgVqJBx3UmNF3kwj/zhJG56JBvJo1GQuO2IkyGOC84wbE+P6snSyb
	5ve/riH4zCMsq0MjWRlSklH/1fGIeoNcq305uJ1bUQr70KhfkUgEtUDtCkQdLq47CgFex
X-Gm-Gg: AYBFou3o6mShYkZ+IcT284+FM5sUoQj1CY48VgG26bqJsRW07rnHgA5CqUIUi71q0pX
	FbC0YlciAXlR4t4GD2BnqRGBlKKnj+obUGcwjiYs5LJwpFAG9e48fqABDxq+F9F8/MhVQAJSMKj
	KtTHxwNMrTY+FKgdUn6Tmq4mtDSnGXjXWO1Lfx7uKN/5xH3d+WmsQ/Z79r5s3bxyQSxS1IFT/+C
	rE6S9VAuYk+F84GdAVc3knUqhmTRlsfdpORjCsushRXap/oFUbcLrPREFd6ZG3uLFvQoEXhPixM
	D05nNNiQrdalomIUski6D++Fnb3w7RNyACn8U1yjTpbBjc86FOfbZ7TGyhIw0t507rKF7lcIzMc
	saVHWo86jkJemxD7tDkPqwdCQrVI2tNSRntg=
X-Received: by 2002:a05:6820:f021:b0:6b7:83c5:fde6 with SMTP id 006d021491bc7-6b783c60324mr24813681eaf.39.1789046970690;
        Thu, 10 Sep 2026 06:29:30 -0700 (PDT)
X-Received: by 2002:a05:6820:f021:b0:6b7:83c5:fde6 with SMTP id 006d021491bc7-6b783c60324mr24813654eaf.39.1789046970293;
        Thu, 10 Sep 2026 06:29:30 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:29:29 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:58:54 +0530
Subject: [PATCH 05/34] arm64: dts: qcom: sm8150: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-5-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=986;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=jIHPRpMEkaV9mAQmwuXnsCksTtsHuY/XKo46rkvTq0U=;
 b=IkUgIuBOekfhfpKxy6eVpoCQCOSk9g0eSiscseX8FlZXXwn97G1B4zvfbHg0kJS1QHk0Gj9rb
 97Ved/E/arfAYJ7vm8T8Sp2yPXLIm3S3qfRvW8IesKZ+tLLJnAjwN5z
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXyApdV1x/AHZ8
 RsrEB1mmZAUpTaf4PXCTyeeJXqWwQgQRfoWYlylf6/JN6i0UOLlOcblHvD6kxQal7ILzLIV5EKZ
 IqxzaWssD/O5Kg93N4PuXMJ1Gj9i3OA=
X-Proofpoint-GUID: 3G05Ny3hdM_Pp0aYj4jQhmmaDftMGYl9
X-Proofpoint-ORIG-GUID: 3G05Ny3hdM_Pp0aYj4jQhmmaDftMGYl9
X-Authority-Analysis: v=2.4 cv=EspHPicA c=1 sm=1 tr=0 ts=6aa2b0bb cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX5nWIL0wzJ7MC
 vBQxIpJ4AK2WM948I7CV+kd3UGOHIcDCtIaD++PYnhnzGrn33PTPtuCPZ7+ZgBjvE0IoF8q410C
 cIb5lpIfQ3uD49+FRrxAm371sROo6tuwftXTiwtRahDKgKUnGB8yyDl802iG7haYizfBYkA3jv/
 B2Uc0eYvHb57OEDvp5DDedu3YBpCae6EN4OSUqC81Cft1woqvIgfvO4JtdIEN7/vtCaDykAjUt0
 05GaOo1NlrZY8xcnZO4PG7eHbq/pYDMyv3K1hzKuOIv08Zu10TxA9fPryMhf/CQM+KwA2/9nQ6P
 K80yP5Rq9ekqH0+RuvXmEwJJ8CN07ybCOog7UPM6rKL+ysnK5Go4eAf2PmwBLv0gH1CFlHGmUtV
 CM00Bei0lRL8B9n1xJwn7hq8LdqIwo6N6F4gyDa1LtpY6/VXXBAG0qy/fwtn+0VoUpm3QV0dPcN
 cKX0/6I+2YrRPxf42aA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 94a3b02cb289..74df5cd86f04 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1905,7 +1905,7 @@ pcie0: pcie@1c00000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 35 GPIO_ACTIVE_HIGH>;
-			wake-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;

-- 
2.34.1

