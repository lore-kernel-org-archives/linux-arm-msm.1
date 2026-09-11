Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BE3434988
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109448; cv=none; b=ntJy+IkhsgcYk1IJ11F3r6HVDE97xjA/4at2JOIVPR4Dd9ZbQamnpau+qFoZaXCnov2hyzl1VT+keQ6N7QnNH5xRVqxNooisE61lg33pNhW5A1R2iOSbB05GydE7mNLx0RJ88paDfQHQeC7V1i0S8FVn8lF4GvCpf2IlrT/Ryps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109448; c=relaxed/simple;
	bh=Zy1nDF/DGXGbilrIO9Eq9qTkQ4vO1zgJJLXe4gy7WTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H0OlK0WhZyXagMIludsN47m78ddqIBpz3R/a4LXpvn82PV/m32esndr3AOTPJ95Svcb9filxUirJy1fxvwJy78kdd+Vu6wQBBLzdCKmIbBd5xjyUYQSFZrXg1YD3nQKbwqDC2uKZrEnufkFZgE2Czl7/CXSOAAC1/XT+5itVeM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aw//CoOx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gWqnJMMJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aw//CoOx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gWqnJMMJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kf4Q3230299
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YNUwZadVXTzYgsSTqLloNJAy2d3SAMmkGcycRnUt7pM=; b=aw//CoOxEYODLNkl
	xnyJy6mj76bIChUB2L516I1KAH0YOXtd/LkSG1AmvVUf5o1Zfzlzi06PBzj0lniM
	PlJrGGzD814xb0bkAjIRXx5u4LxbNxhQ3Ou7L67Y4UA+aVfMFH3raB2vzWHKfI1/
	WiVA/k4WUbGzndv63q+Raw3P7Wo7mT0XX23xW/TVeNLFmyv1Xh8BMPWcTZW/jnmh
	caVfNj2iyvS9whoMD/NxRJjuGTOfa7nPlzBnb5v/ljE41UZgxEa6GDHtYoI/1G1D
	IKsQXTytNNuDOuJPXbkZagNzEn1Nbuva1v09KdlJ/f6Yk3pq9vUNyM9apxiA+yL6
	xPi5Mw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm1k2afk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:50:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc39363cc88so718304a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 23:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789109433; x=1789714233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNUwZadVXTzYgsSTqLloNJAy2d3SAMmkGcycRnUt7pM=;
        b=gWqnJMMJD6ECQyXNNlHf+yBoXIGSc6h1F5z2toQFd5xguyW/jH/6bZCPW9ZA6pol40
         kM6X8u/ihAun7lzOJca5DWERGmxpkpJ8FmxJrFLxXD0zAzdPoYFGjrvJq+YhHuVE8jxl
         +ssC1PongaII3OZ+qlm1op2nBDx3KWESrtbdVBKXJi7N0LyBB3fCZSiGAJ9/yoXaKfpB
         czWfBnBkQzb9WZaukzeRRypH7smsPXjgxIOFwlyn3t54UoWzVX3ysY7gArSDKAQoA8kM
         WQ38cUCgMxnoXlXyPE3MSKURnqqUs+u4RBjdYIH5BxSh5aapjLgbkueX8FkNskbv5D8U
         aF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789109433; x=1789714233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YNUwZadVXTzYgsSTqLloNJAy2d3SAMmkGcycRnUt7pM=;
        b=egts1BBYiteOshRP9vIthM/MgAIJ9oj7frHwHinToxvXN1aOOhEZ8cXOnJY4DUV7yl
         NzdRI+/th8xOkb2cTOhBriiYUffv9PBLJ9egllI1yAH+WYCrlPMduqGxy9Ln6aDjBao4
         HLfsld4wM/9iULaW006S+7Kx0FbUMW4s7HXQl8VyD38hQGDt51hSMCYUuNMbbdXbL6u8
         eLKlSAg8C3pJ3wXZDnfG3qjoVa1g+gFEEmjE2sBkYVCSrIIIcyiVE7TmCyafJYzdusI/
         y0APXABNGW0x79dGEdW92JcQIC7MrTFQgZXOvRUPCYqpq1Zi8nszY07zzrAxuBkxZmp5
         aowg==
X-Gm-Message-State: AFuF++nBn8n4ciwAQ0fekqu2+mwPR6XzfJ5zXio3/D6jrLtc2KXqb/Uh
	zGLqldOY/1EVEOU4MpG3RQW5M3LlMKSN9G0bc4XWrL4ws/y/cqF7qnKc/aPiQQxzZlhCviPmSD9
	WnYO14OrWr58te8z3IuEQ/R8AALELMWKIjxrM9pyYW1O7qYAG5OBNylPSunhFllLuow9M
X-Gm-Gg: AYBFou3e5CBU9fjHMSQD37NC0IGtYeEo/H4W3wCCgIfcmJsLrSWZUTY3USWqUGXecMk
	K2AO2+oICU/fJz5zinoyTBuA2xBVQFFxUG105R0eCqI/3UkGARDB1Q1mH00zGzc9Jo0SkvXUauR
	dhG6E1SpkUOQf+H2HIRf4c6UrtA8JS8ZyLnZVioFfpVFKAYtWueR8JYSG2ySwpciIJHosWTBPcK
	148u5ujujBFB0L/HZ9N42LBjQqUb0MIWLyjVukDigvQe93Lb1LbzCdtXC7cXnNQmM0oKENtt+wa
	frJITHJh3QvsD6IYwLa5FHoU1XRNW533SQZv/oLPsbtN4Mpi/8Kp6ohpVFViFKMjlDwV/1GNVH6
	hHEA5Ln+HE3sFSdLcv8iQorPLKWLYefINa7k=
X-Received: by 2002:a05:6a20:1611:b0:3d7:eb3e:1c58 with SMTP id adf61e73a8af0-3daed1c1684mr5578939637.8.1789109433312;
        Thu, 10 Sep 2026 23:50:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:1611:b0:3d7:eb3e:1c58 with SMTP id adf61e73a8af0-3daed1c1684mr5578897637.8.1789109432863;
        Thu, 10 Sep 2026 23:50:32 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm3934383c88.1.2026.09.10.23.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:50:32 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:20:07 +0530
Subject: [PATCH 6/8] arm64: dts: qcom: talos: Add t-power-on-us property
 for PCIe root port
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-t_pwr_on-v1-6-c9eee197d082@oss.qualcomm.com>
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
In-Reply-To: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789109406; l=806;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Zy1nDF/DGXGbilrIO9Eq9qTkQ4vO1zgJJLXe4gy7WTc=;
 b=nxjjBJNV1POpH0eJm1s41i43XAC2I1huQFPC+S/p3Na2LNOpt1Qgp54qvqgXYTKbCgtevvyta
 oJZwlEZAigvDGse6SRzr+MYMTgdkwOKwKehuot3Y5z+tTexipBxA0cF
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=cM11IVeN c=1 sm=1 tr=0 ts=6aa3a4ba cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: IA5T4vzrO0aLRefuXV8VD_XjOlH7I0wV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX0vCXnje+TIxT
 74skT4xJfxpT0IbZ/ZGdG1QcANDysLdVi80TJVfC3sPeRfDtYEAo90K8mn3LnH4EBFIVT+uFtds
 wmmE+Jdri1B/1V2tSeD7Xe5HrTt6JH0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX2MrU9+Mxaw9+
 S/GsJC1KucwaMfDYVuU2pl4wA0vu2GfFepQWRfF0baezmd+QqwP3QgI8KztWUi1r2jY/iX4z5km
 zrQ4eBkTygRf7WwTELD3QZz9JzDHpMQK+zPv9sLGsNCX3HNg4QloLrMiGScldPXCWPz6apProrc
 TuB/x+99YwbFhTxxneHQOQpt1eoxcgbbJjiwq2BK5BEEWlYpLXVhsYPKCw2xJZPBOvTWXvyBawm
 0dopdZLrtKtTFwphU8/G9dNPolkZQMriZlCmKTjpOhJAwSJM6Uc0lwKXDoCqQenh55CupmbtzkV
 aR/LVfjX1Ub1x47Y6XjIgcqPcNdGZOYLJ0zuTWel2wOg7JoxYvy+9Ot+dyYQQrxWFBg6IrefwPB
 f2cP9Lc8JCQtaVSSy8xQ8hno0bpD8wx3ARGV/kSRXyokGkU5Nt6OZdbp/f1QQU2SSqwi2xpub/V
 yT0mEKJ59fMoBRj150w==
X-Proofpoint-ORIG-GUID: IA5T4vzrO0aLRefuXV8VD_XjOlH7I0wV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110093

Currently the PCIe controller is not programming the T_POWER_ON value,
which can result in improper L1.2 exit behavior. Add the
t-power-on-us property to the PCIe root port so that this value is
correctly programmed during host initialization.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index eedfdce3c479..ceb1dfc5189d 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1401,6 +1401,8 @@ pcie_port0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 				bus-range = <0x01 0xff>;
+
+				t-power-on-us = <80>;
 			};
 		};
 

-- 
2.34.1

