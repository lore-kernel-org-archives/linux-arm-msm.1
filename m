Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161D83E5EF5
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369316; cv=none; b=XXdmNt4bcejt75jinhnYF3CuTqmopmIGmaoxw3prAxMtA4EjjOxF0D6t3v80KX7tdsE3X4zlgcQxoyHGTR/i3kZjwwIMp65R4tyWW9A4Yqmj++lQpVs8XpsUdluffOsGgEGKtm9cGvp5GS5Nojm2DkcAAPPiYhUy36kCewiukeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369316; c=relaxed/simple;
	bh=42U50INRSZxWg3ETrZcW68RSLtaZLOmje+FzHwpFxbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AMztNW1QoBWKRneahOIIop5904KWdupVup81ZVumqGJT2Yt+L3/D7uhEmP/2QD97LMWJzm+KGyq0+S7KscMuoaycb51Z59010RxzhI9VAjGucFKnOjXfWLQP5FykQMQ1TbLgF6Y1jTck6+QVhGBs2Eg30JTzA0jSsdgO40NGKuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NaHc0iX7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F8pTsWMF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NaHc0iX7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F8pTsWMF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j2Ys793892
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4vrMYgIQIiWa2cJzCSEHychhDLNiioNENEzvG+FNq5E=; b=NaHc0iX7IDxwlzSR
	ox8w2Rn49V0QWKJSSNiYwyu4i+RUDA641AaDrSs1Iw/JJtu+qdykccVZvc94KfYz
	kgTruDPPteJofF3U1gKTkIT0M7vL5adLKuYHtHtAe28TpQsp7LjpHZtT6lDZKM2x
	GXH7EiGAyxnv1b3/f5Koa7j2QEBeWm3iKsJtuwbG52FhjKQ/wN0yPaWaW7vksuZF
	gA/Uv/Dj3XHWlt+MZ+DjAwMm/ZpmQmxwgWMQpaYdede0JGOsiptKhCxdX2Dc9TL1
	Vuq/+jmJei70Sy6wAkHe9egREopLfQC3jBUFi12iCyPIKjZvOcIHrHzQm9qrYRUZ
	/detbg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cnd4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:01:53 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b1a3f01d2aso4253333eaf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369313; x=1789974113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4vrMYgIQIiWa2cJzCSEHychhDLNiioNENEzvG+FNq5E=;
        b=F8pTsWMFsgYkLINfA6zYj5jEj6UNfXuzdyzaCtAx50IlTzBYxcCa7zwFN4e0Alxxzv
         t+0U2Pv9HaW9E6fkxJ1W3TxDjsM1a2qfce00+uuLwbbssWUL8DMR9OVlGel2kb4o8wbn
         WfiJICBVxfGVxkJZazj9f+cndAQMPcIwU8Oc+ccwCrzYkQtp8QS0O9XCnu5s19cUkvcq
         WzwO/abDK8HDHsLI7IFnvpz4qNAqWsOyHNUvPTrTZDMbMwwaT2vuBmcl1Vn4cK1RXzWq
         jKuhqq4r5jFDR6tM9MAlpZ3iHvGGirTcYvhTdYWC+DlbldwJ3PQaRvwkVe+prMF+fUft
         vkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369313; x=1789974113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4vrMYgIQIiWa2cJzCSEHychhDLNiioNENEzvG+FNq5E=;
        b=P3H0D5zH6gEsFCwKA2hQUporEY8FXTpLlBcDuMkCMbRqTo3K1fKfz5Y//20AMWjsfr
         CIgXGWyS6OQL5CgXndt2vb8Ui7ghpB4Rqe8mpBBNqu+qeilGluaCMEOHpOWZBnKpFJwv
         Zv9pRYkdDMGfqoim+e4y476weqRHakjkSsNVY/lykqkZSVVXDTQ8AytPbgNloLs4/Z6X
         4m46O6UOZyqeD7+5D6f+3QNhtspWhM++dCYFnkxpgtR9lpixDqC3yRkl2TQ/32YKR4mi
         ov+qLSiMdalzzGyTm1r0DXVJB1ezZiAK2bW0PyBd5zv0+rsx/4Amv1BefgFEOgm9ywpx
         ayoQ==
X-Gm-Message-State: AFuF++nGIKADanFaL4/u/CORRga20O4T6jmrxY/YrpdUcZ+gkS7DVz7A
	4ohWnaJnf5pfQe/4iPvMYwzg491IiHHHEwTQ1L8C8LI37qkFR6nAZHQ2yUqI3iy+6kH4rRDXZDe
	9jotIzAb3f5JnCFhKbxZY9UDDOadqZwHloTR22Lxwe2y9h88DeBO++svPuUqCDiZIAnW9
X-Gm-Gg: AYBFou3Kcy8WBvXbOvH+/A/U+1fHP97jf3MP5YUId1oRv+BKS7sP3oc/ieORoru+X/4
	0ZGkyRtP0gsGt7m/FL630Asddew+89HHDeqexqD0eHXINXfZ5dADJjX6310+PCYQr56fXQANtBw
	2/TFlFwQwYJy2lS+UGABUK+bfzlMQ6kffnltIxrOUbpZSabzZIjNSfAj/5IkcbpOyK/Dk7CfBHV
	PzYfJi0n7JwU3xPbrW+rjlAJ6Sm8jWLrdCDgfRuwyCzJ3UGcImOI3yIdM8fIu4ZfBf7mGUhotnJ
	F8wdlF1nq2mEEiAWtBZh0spgdC1wJSYtinwxooqqo9j8BDR5Di8f1CSCpIybJF6XL+kbp/W6ibp
	h0vuZW0y42RWNI7kIMWamsr0pLyi4
X-Received: by 2002:a05:6820:f09:b0:6b7:46fc:1cd with SMTP id 006d021491bc7-6c542041664mr511926eaf.44.1789369313144;
        Mon, 14 Sep 2026 00:01:53 -0700 (PDT)
X-Received: by 2002:a05:6820:f09:b0:6b7:46fc:1cd with SMTP id 006d021491bc7-6c542041664mr511895eaf.44.1789369312727;
        Mon, 14 Sep 2026 00:01:52 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:01:52 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:57 +0530
Subject: [PATCH 25/31] arm64: dts: qcom: qdu1000: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-25-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1314;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=42U50INRSZxWg3ETrZcW68RSLtaZLOmje+FzHwpFxbI=;
 b=exHzsO2QFVKi/VGkfXrXAdryRDbVul1DnnyjD25sEfWQEJ2BdWR9TE5GswfEGOJDCgMcd+Xsn
 X6wD5EstB/YDj1WIVD0ma/b2ZSFrdIkmrXuMKyE+T3H6AXOqVX8yJXX
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX5cTXPFayEFym
 h86YsMB/OToOikusJcRiqJSsveEa9GPQFCUPjcOBGg5Cqw5t/Yy5AO7YqYdczpn3QxQsWezXgfN
 MsFN32jpH0GVcrk6w4GbidjBmD8tlFv39P/XjKombzzGBf2Oq4ETD+kP/uerEe/y5QtATaQO/hQ
 tLWiXh91Fb8MvC+IFWSmoyYizJlTiy7ADCh8EOFK8iUShBH+4CSmp41vN5as0Yaw7LgMmRGKVxR
 gqLBePjdVFsfkYoSMdaWXN+oiGlVinxHBcIy+NThhlweyAFDEJgPjeSICdrUK9GIt/BrtmcXTcH
 +E1kESd9WbONGjoiYaObpnSD8h/KzNeCHRAjQJ1V2whUIve9nrttsx0TRP45i5wL/nkTMjp3Dua
 w1njP1OFMoW5vOU1EWL2qXqKqJP+P87r14dlsnb5rfl/vpYTvxrxMt7RL6laUqyx/MMRsa01lM+
 d5vHO+Jf17jPgYhW8rQ==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa79be1 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=8fg_tvuPYJi1a8Ph9hQA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXyAJZbH5NjFq6
 OfDy+7KxFRztkxvvA/uPLZBVt1WZXAxIl4Yd24DfLzkbCrDjAPSI1BKrB8R+61AiDnm7Wbd/TZB
 AglAZz3Vlgl28DV1oaJWHeJQx2wZKAw=
X-Proofpoint-GUID: W6KKNiZ_ugMioEMsWNcGrTBZeS0PLK1K
X-Proofpoint-ORIG-GUID: W6KKNiZ_ugMioEMsWNcGrTBZeS0PLK1K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index af106aebd30d..1dfaac8c84b4 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -142,6 +142,7 @@ idle-states {
 
 		cpu_off: cpu-sleep-0 {
 			compatible = "arm,idle-state";
+			idle-state-name = "silver-pll-pc";
 			entry-latency-us = <274>;
 			exit-latency-us = <480>;
 			min-residency-us = <3934>;
@@ -153,6 +154,7 @@ cpu_off: cpu-sleep-0 {
 	domain-idle-states {
 		cluster_sleep_0: cluster-sleep-0 {
 			compatible = "domain-idle-state";
+			idle-state-name = "l3-pc";
 			entry-latency-us = <584>;
 			exit-latency-us = <2332>;
 			min-residency-us = <6118>;
@@ -161,6 +163,7 @@ cluster_sleep_0: cluster-sleep-0 {
 
 		cluster_sleep_1: cluster-sleep-1 {
 			compatible = "domain-idle-state";
+			idle-state-name = "llcc-off";
 			entry-latency-us = <2893>;
 			exit-latency-us = <4023>;
 			min-residency-us = <9987>;

-- 
2.43.0

