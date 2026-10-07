Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDBE490C1E
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 09:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363956; cv=none; b=HK8C5SVCRJ8EFxlFbjQkQg0hKt/e6F2HbQHi/osHJG0DLK4ZtzKC1drWLZQtoM/LpqzkqC1oAU8RFpdw7PkBY5uqRUd/UL9NSs0DQtzYrSSbSRUagCpb24021iKij8hxYzCknJkOw5PFoQfPb/8u/F0bBC7Ot85qCrWiH/0Q+3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363956; c=relaxed/simple;
	bh=o5oMWdlrxTsRlmHOBCOZYGSUWpstGq1VRL0Ihw6vWro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E25/J07oBegCByLEHfoulZhEQWdPNfhi8ruoXZ7x87UgUrjYm/uMQfyG/82f1LnjbG2iHqkVp1MPZPhXaeF9EyFsFDAq3whAiNDk2upVrdWM+faoGerJK85+412DprJ5yGOE+GlrTO9rkSu8TNsFFoRmtGYUi7un2xmdksZ11h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AFkMoETG reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AFkMoETG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jib6151961
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 09:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vf6YFVaTEQg
	R6onACOGmwSOqqweT/zzISJg73uugZWI=; b=AFkMoETGrPBVySR23V2yQ7qaOuG
	l2QSMgqKauKCzk64DgQaA3YhRyZo3DfJB+VktD5EX5BKP57szF6kfCGbbUyFCkYk
	78h5PDV6Op4/qQCH1JJOoytZOrOs9HlpZltAc+POU160VAE883d+JxLWHNaP2RlE
	uyH+/9kDYD/l9GkUpCLimzV788/Vmnr3xAeWZA2a0Y4vJJN1J86fRf2eCz6KN+aQ
	uPdbL7owxVeEJFtLi6llxRKl2SYigIH+5pjXw2z0JV0WFH/xVoGP1PREHhzmLNNo
	HP8GIyU8RTFALGsK2WHErd4fooNyLSPElLsIqZ2fXvQns1UqU0d7ySkjLLw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c719c2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 09:02:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so921968285a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 02:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363767; x=1791968567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vf6YFVaTEQgR6onACOGmwSOqqweT/zzISJg73uugZWI=;
        b=f6Dd+J+DRS/4ncT2rfJHZoqymQOs663sQvbY+Nmq+iG4OS8R7aM2oLwrYPIQ11Lehs
         xjwu9XFxlpdk0V7tyO3C8KmPIYK3sPnfNGoKutDeOja1rSxv3rp/yZLv6SWUy3ZAWJyS
         PufWpIdJMQfwpIJu2a8mmryA9E1cRR5OZMax7dzGam5VsnatN83ZYAUBhBt0miixaJU8
         XoVOjqvnORdTvpiJqHB6+IXJnRO/bk8IPKpwIRpnRVgUn3OY3SwQvO1aVc5RmCzxCj+T
         xIBpd9r/aBbq8C9O+xedG9GATl5r85R/TD628QrOU4b+6ouODAeLKC0Nya7aig/dJTgh
         tBBw==
X-Forwarded-Encrypted: i=1; AKwUvBwddyLEW4Euhh6HrlKTrqRIsxoMjOP622XZti9772d4219hoL8cWUGAg4McGArv9vr2HxoYb0RYQYAo9C/5@vger.kernel.org
X-Gm-Message-State: AFuF++l8O4QVLx8tZSM4Ecz2ZVPc20fd4P5FhC0KCDuMB8lqVPKQfjzH
	xl2AampUzVfnvaisI6WxWHZ5LYlitE8/MkhJ/PEsr4pP1YD3FWL+mxts2COi4um5wzWCABKHqlx
	WK6G66iWZocDmA0xdatW+w+sTbJnJZvsT43e8AoTtQxPj6ixa4NmmHvsx3NLcdAD2ycP4
X-Gm-Gg: AYBFou0TrnsxD+RMufpK6dRKpuiHejxwHwF/knLeGWm69oOsBCXB92tXfHePYTaZLdC
	zDcOrgeiXcuUB+Nvsj38WswYAwrrFhOKPqQOvwndWmhkIXJDU1h3d3cDCBlRdWa6nXjcAud/gdK
	6simSoFOZgJF4dTd0QQ+C9TVsRWV+fLKFPaCYdLbkzKZmauJxV8TwZuo//RKD7qTtUsiL3ilhT4
	Woi+l7yYwXw1vGEdVYvQ7q/2TEK65TczWYD/TsbWCtKKrzJYqKZDshUWiy8gXdULbLH6KKUP36u
	t7q67my0dJtjt7CQ8egnZrXxo0+EQQvFkUoi3/QGW90zri+yeQW+D8YToUg=
X-Received: by 2002:a05:620a:17a3:b0:93e:646c:9133 with SMTP id af79cd13be357-93e9b7f7793mr303006885a.64.1791363767574;
        Wed, 07 Oct 2026 02:02:47 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:93e:646c:9133 with SMTP id af79cd13be357-93e9b7f7793mr303000385a.64.1791363766962;
        Wed, 07 Oct 2026 02:02:46 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:46 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH RESEND 35/45] arm64: dts: qcom: use SA8775P IFE resources
Date: Wed,  7 Oct 2026 12:00:31 +0300
Message-Id: <20261007090041.3732717-36-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXwTTFyyqtJcHe
 kGVxS27aZygCu1cgwap33JSnD3LFjPBPsLgxGUMzeeydgwZl2gX4wlirND6KG02QfFB4lRPGwyf
 VkwBQzuM+9omZ4437zPGLFJXjVRJ23s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX9DyMj7z3Pkb0
 rpuafr1dpI57Ke2cn48XQkeJIgIlF1BYKfnVyhWhtg1f+ghcbzL4RXYdEDNVpW/o7ipwrLEkx7i
 Up7OgitxlyG7/3sb7FpErSyoTg+ylnPuW6Al4GQW8i68UJ/jL8++34a6buk6ggJ3j7JWSlAkaKQ
 65V9X21T4BQoEnpp2j4DqYLZTL3zM9+Q5/Oe2A/2e75qK2hAMShv6Cw+29G/XKpZq3ufSCT0FtC
 3ji0DK0egxIj7pSv9iFa6HbtaM81II+6lO4avSjHl9jou+LvJsOxMBgW23gsEFOwdFsOvj3Tto6
 KNBnQf0uMRRJMcmq3Sa8iSDLgPXZSdSr0mHKUatR6tyH26hH3IdWiJRsJnPVpjze5a8bSmPAWnY
 jDWsfq30Mf60qVWfvkO6NbyJcn39SG0+rIxQTqwYtHgMBfBEI87cqJmDznTK5/UXuVxv60MpYEE
 o/uBLxANGsKwLUVVlPg==
X-Proofpoint-GUID: R1nCnNjXjHEe1BONejD2QYzzksS2_5_Z
X-Proofpoint-ORIG-GUID: R1nCnNjXjHEe1BONejD2QYzzksS2_5_Z
X-Authority-Analysis: v=2.4 cv=LvYHWXdc c=1 sm=1 tr=0 ts=6ac60ab8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=-SsTkY4pZgJ_H_-AmIoA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Select the local SA8775P CAMSS pixel-path compatible for hardware
validation. This commit is not part of the upstream series.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..59be841b89ec 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -5167,7 +5167,7 @@ cci3_i2c1: i2c-bus@1 {
 		};
 
 		camss: isp@ac78000 {
-			compatible = "qcom,sa8775p-camss";
+			compatible = "qcom,sa8775p-camss-pix";
 
 			reg = <0x0 0xac78000 0x0 0x1000>,
 			      <0x0 0xac7a000 0x0 0x0f00>,
-- 
2.34.1

