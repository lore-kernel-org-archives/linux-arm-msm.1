Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596078;
	b=HJU9JdytCtg5SMYgc1Sp9ISRaeut/dKRL2h1FMsfH3qsWqtMAPMtRFbCKI+aP5Rbkqga
	 LaMHH74pg06UwScTS5G9lUzwPZmIv/FiRIVXoZuDS9yWleAatHQhIYYFYEVH9M7P/NKhx
	 qva/42LL9Q2uK9dot9U6VrwjM4pnKB36VFYhkpgLmVVye/eVjyckJwy0S+63/l6WSJ5UC
	 +M7oKMg3/wI7NDRXbqgiQjjAo6cZpFbeMF4640nPHowahANeAR8+AZX3YAI8V0eeyHlni
	 FsLpy8afSrx/qfvcthpkSW/B3P/pYvZ9ZMi8PX5Ds39611gyltKYOz2Slt7v1YM+EGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596078;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3CA3jmwPFjAFVUqbXgVLGcQiC/Zhr5vktmJBynIdqWU=;
	b=3ENa+hsL9zlQ9F4iDTw1lNw9oOsl7PTqFuWgoBSc8JFUHpJUj6gWpy4nZezvM49lq6pM
	 7cMBJxh8OzhqXoJyFhVKKkV/uQcpzr9SMs4HmFrgRYky7AflyEs9451k6RXZBoVe+vITM
	 AsMXTPDIWVkWLUIZAYGm+yXv4kqJC2pLQa3foPe4ly7GxVNIHf6UwI9EkanZDIP4YGmdW
	 Cuxyjf3GBsp84pTfa5XavZ4xAw01uvNmGMG5k+7pwHTEeKKi0z5D3n294dsldKD3U1MU3
	 Qxuzsc3FkTMN4vVY7vtVQaTDrk42gL6ED2D7/j5aVZVh4m753Jn8xwLuvnETrAizquA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zbi8dN1J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kKImZ0ee;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24E3607106C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D24E3607106C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zbi8dN1J;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kKImZ0ee
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR3xD2022977
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3CA3jmwPFjA
	FVUqbXgVLGcQiC/Zhr5vktmJBynIdqWU=; b=Zbi8dN1JZj9nRxiM+9o3pmIhp0B
	C8kah64F2uNHdUjGRYZcDRXVs0sOcaxyXPCR46xkVwloxI0aqY7Kp3Lvv2IRMLO2
	jEiXIiaIfRWUfuxCkaC/Nk+k1ade0Uo/22xXOIuivCP5aLlXBZ0YLa6+t5SX2Sbo
	uwOxkmpeuM19wHN6Bs9pK6QW0Qt9rg4GfL8Q2bcBkcXCuJ56Z9NL35CIQxyOiys+
	f0jH/6IZxVAqhLKqPuBDyib4ZT+WupydjFwdlWfThA2Qrm7cljnIwT4+bjLm1LhF
	trrE59R+xlC4OWF3nCUXHBFmmLs5IUuMT+5q2MCw7Rh0Me9GYIudSCxuSsQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx0g21vu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:54:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94960131b4eso66223185a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596076; x=1795200876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3CA3jmwPFjAFVUqbXgVLGcQiC/Zhr5vktmJBynIdqWU=;
        b=kKImZ0ee7SJIq49diXsrYgaBdVAII8tr7Ycu6oRVg/2FtrgB775H17rsbnzgmJfAKj
         D3j7vlsDRQuG1GcU4zJoapU1+W5EIZfJxzrQOO7uOqO1uy/q9dqFsAfGcTC74oOj/xhc
         GiBHsuYGwX+/sq3Se83JZ3oHBLa1zFOfKl+9KqdfNuHUAXEReRKq9fM/X1ByTNDA88W0
         kcsVLMe4LJisB6GC9KCsgOJKzZPwjcSP8bmPbRkbMNTcg227P47cFkL4GZGJ38/Uhwa5
         IQsvH+zOyTfUBJZr865LJrehl5ONkri67gpgv2um9DkmU1LRckYB9K6gP8wAjP/tAjp2
         GIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596076; x=1795200876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3CA3jmwPFjAFVUqbXgVLGcQiC/Zhr5vktmJBynIdqWU=;
        b=QVb829LhKyKOOSg2o0YPOtEOudcfsWEUg+Io+ZA+rUA0f5rcSVmyUSd8fvViDhhAME
         JmlcJ2Mlf3OVKnbay1nKGaW6aLyxcOEiYHDJWv3LVaifP+mqRei7ODo8VFB0bwF5Pyzq
         aD6Xk58mdSoA18CPz7pGVP/W42g6hqBTV2ZQoewg9w6/f/UFivp3jzbqy3W6LzHqtbvA
         YPuE7cCAfGFedpL8QGnZWIumtYk2G6hyl+dOIL1KLtv5H2pk6ehJ1XVdhFtsX3N6E2aJ
         ddrtnt+NhU2rt31kGCjv6sQ6i/9jF41ObWo5fvhpXOW0/Gbgx7h4o6ZM6BYoS1Z3UHca
         tx1A==
X-Forwarded-Encrypted: i=1; AL+hErH4hO5hkqMZrMwhqcwc2TXQLieHI3KsQopNiujXJq5JdKNIJwd8UAIVIVCAvKnfc+IakjcD92EKSSxGXGQH@vger.kernel.org
X-Gm-Message-State: APuU4Z84N14MbOg2U/xVNj7L0sgPFTtfPzbQ6OeIgJhJm26gkjjj/sVH
	dIcP8EtBuad/EaoVjVqNXx7zmlG1qkz5BPzvS1IphUTnx8Ylp6po7UKwhGw46bhKOUfQT+TWZ/F
	yDeggaBC9E5L8xS5O/+ypcaAXrvi5JVcGBQn2QALhb/92OGjTLqDnyW4zAowhqAxAaZ0D
X-Gm-Gg: AYBFou0tpJAFEw3mxrYAQqtIOMTITqt43s8R7Sw6xPJ8CiFUTyfuMQI5xCKOj4fa0SA
	vXC7zukCd8n3kKNppZ8rBbPSCkwyUcfVmLWKQJk7YOCYYBN3F2lq4vK3ZYc9QaJXpxShmrE9DCS
	kmh95X0F/XarFNm+n/rVPxVup+OLn8jRgDVfMU6iSnOAZZgWY/TZDETVgBMbDbeuadXBOqMPdBk
	MeSqBT049ifISFiapuJMvWuQoGVqANipyT5bvlVY+Jt5KzxihIgbsnO+FIrzmKEv1wB6d6ZxDgF
	t6AzvbiLeLJGVDktNm29w5mSFpkFdY36Ei60KFETtZnqocNIY6KTkVX79WMGum0KLXErDodpfFI
	Xu4gwSdPGTerw9XOyVAOYh/RQ9zO8ZV1Fytm4BkXnZv/1qg4fUfLWltO1VqeKRQ==
X-Received: by 2002:a05:620a:3725:b0:93c:8e3f:3036 with SMTP id af79cd13be357-9494b9c7b34mr606886285a.4.1794596076290;
        Fri, 13 Nov 2026 10:54:36 -0800 (PST)
X-Received: by 2002:a05:620a:3725:b0:93c:8e3f:3036 with SMTP id af79cd13be357-9494b9c7b34mr606882685a.4.1794596075877;
        Fri, 13 Nov 2026 10:54:35 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c888b90d4sm5762454f8f.9.2026.11.13.10.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:54:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: qcom: qcs8550-ayntec: Use hyphens for nodenames
Date: Fri, 13 Nov 2026 19:54:28 +0100
Message-ID: <20261113185426.183501-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113185426.183501-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261113185426.183501-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1064; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=V/f7MLrGSretAykVIUBtQxm8vmwlDZtYfbg7haKORd0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91zjO+W0w+a3FQlt9AX4aoDplJF2i3TZ44v7x
 fZcgM6OQmSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdc4wAKCRDBN2bmhouD
 13c7D/9uMWDv366bIsma6BKHisAvSMndaN6hcYcfWkPnuWMT3gMpr2dbMNEJU5bXHoaHrsmt3Sw
 0DHk9Un6YlcB/G3Enz7Q28rVQ4Nd3oLwW2Dk7XeFnjXGG6wlaoNl9MrcvXL4zCqsuTaCT88kutr
 bguMCuIRcjyPL/l7KiHmldYreOo8jmziRAnKqDRYCmUevVCRYuNzvBL348wYHdDH8qW1QZCfyJ1
 aw5cSex95Nbzi4pZhzfTL6V+mM1ilWdd8xFRN7yAU/gF9XgUOPtRjxswhJpVSs50fphDWdcNjAe
 83GS1NZZ7uaEHpkzM1qZPYh3WMdMHkIs0Gj+HCF8h98eZglXdj7V51d1XEvxlSXVNZMtFQcXPES
 XEBs3mKchJ4ElIPR1f5GdO1PQsjv/Z97vkxk5nJl8NLpwe7f7FBNdvXKaESQ5qjfDX0LaUYxdkG
 4783piR3c8FVa0sksZh/wf9TlIL2Tlz7KnlIdVkSL0WsuYY29mwZXhWwHO/nY/hZMGPQHAxVRkc
 y9+/9Z4KvhPet1SXJS0/gvIYZ45nk3baFTb8b/7QiDFTrHDeycWrI1ff4lcVfwXW/nYnSFtgn63
 I4gHtZt6la20u8LhQmCrGWdeG1t5NvyeGtwJdhd5hddLa3y2w4yPgS2azY43UgRS+/ziQDtcoGI 2LQ1G2btwz0DLdA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX/fqCdi6nKYHj
 uP/YZucsldeK3KDGCRXFEJkhvJ8u/th+4YDmyNNUcRJG5cFi0OpAi1ZBluFXs4Ibh/K/vZRrYA6
 QMj35FX5Gocb0o4XPrQkxOVuHmJkFK4uIk7ezmFNsQ6A5I9HkQ2sg2LMAPXsoA2nwU+CnwVzpEj
 Lwh5za4jMdhj3IM1fBq7Y5HheAddoL4F+D1kofoNQtYmXckVv1keGosQ2tLuUNoychnwwtvVGDW
 vlkpeNyjXRNhLfyKiLc/ufziyH1/TYDen7B20O0h9wWSUWWv+sQBrOzQbg059200LiaCBxav3xc
 llYlkDKm2gUOHob5PqYjoaAYZPgPo0JE5sNZrVTG3VoJ24sCTgaNstELbV545hcbxatnzmJO7jN
 EZ+008PG0cqK99eUw11vPjKzSONIha3xX2m1eaTxQ47XP8Mu19fY6ot7XQ/kgqDuAnKWqivMozK
 vLvI2CLbtaAlH/TvOGQ==
X-Proofpoint-ORIG-GUID: n9tpthTZVB6TxTvt8LUqT5ni9ti6P6gC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX4AUSN8kh2Srm
 wgIqPpOSElYA2PGe6SdsSGk+wUZIDJQKtvMdGdlu4i7KzxsvaIiFO9uGuF+vCqIl2AX2BhdgAY2
 4nUYmdx4VuNbGQuz47msORFkPiDC5zM=
X-Proofpoint-GUID: n9tpthTZVB6TxTvt8LUqT5ni9ti6P6gC
X-Authority-Analysis: v=2.4 cv=SpIFe/O0 c=1 sm=1 tr=0 ts=6af75ced cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=RUKCDZl-UO03dcoJ5hwA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130075

Correct minor style issue: use hyphens for nodenames.  Drivers do not
use these node names, so no practical impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8550-ayntec-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayntec-common.dtsi b/arch/arm64/boot/dts/qcom/qcs8550-ayntec-common.dtsi
index d567708f1024..e84a7154c688 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-ayntec-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8550-ayntec-common.dtsi
@@ -183,7 +183,7 @@ hyp_ext_reserved_mem: hyp-ext-reserved-region@ff700000 {
 			no-map;
 		};
 
-		llcc_lpi_mem: llcc_lpi_region@ff800000 {
+		llcc_lpi_mem: llcc-lpi-region@ff800000 {
 			reg = <0 0xff800000 0 0x600000>;
 			no-map;
 		};
@@ -1239,7 +1239,7 @@ &iris {
 };
 
 &lpass_tlmm {
-	lpi_i2s3_active: lpi_i2s3-active-state {
+	lpi_i2s3_active: lpi-i2s3-active-state {
 		sck-pins {
 			pins = "gpio12";
 			function = "i2s3_clk";
-- 
2.53.0

