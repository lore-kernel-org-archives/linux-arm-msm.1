Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513193E0083
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 09:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280244; cv=none; b=HvpHhRJdhN/5AAPGLZtpdO5EyJxqaJlKX3cVcfNJXEthS1JURxvNO3QWKREBuXzkcwKeA7yeecbEnr5nYjCcX8Rbemsg9J+CgV054aI7MBjFvNYBLIhHJWDYx82g3ykXR0Jvz3125aXE109MEpbMZRLL7c1FG5Z6ra4/0oxhNAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280244; c=relaxed/simple;
	bh=T0lN/DapWPxHvaDW4pJnUs2DcqEFLyYI8O4ONz2Onzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pde3TDsiIwXLYVEh08bAcd5okB7XRy7R6mJhRWh6q/nOTPBzpd7t1nvRAuNLURIbGX6eTB+VQKL/N4+4LEzwoL9wHtntR0sXFfZs6e2PmWxkl7TWlwPfli+ATT3Vo2zp5g3aQVWG/Dq7J0JuWX7kNS6N0TEc7VbH8GMNLBjeLH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dXaicJjl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RMWg3ROT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dXaicJjl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RMWg3ROT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966e8YU4103501
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 09:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jS6d1VPN5H+Nib8Nvayq3z8IMlZlt6USSmNHvwcP2Lc=; b=dXaicJjldr2XiWNK
	qDfXDZ46dH1ZHuY06qcM1OaASYRIwMrCacE4jK2IHr3TMIYqdOAsLV6eWfUV1oy0
	wJQwVNuoQ2fGMeHngAdgX1avYFRHgI0fJPmiQS4N9lIcWZHOgkAfG4IeDNo6Qpg6
	VgTs4iJvko8u+/Ss9gf/ANfpGlm4W3mfuFxIIstk5hiONH4JV564ai6RWqbNWP3D
	FWFYEMe9Qxe39eOIuY874by8M8RVS1d5wLDFo9Pl7Ub6gtRCHL8CRYlLmMXi9j5+
	8nEfVdMoP4i5Rioee5Pza/+B3ZAmQ5bRdysdQoSV9uhsZOaD+NvLKVU+PGIP7l/S
	gM2UuA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr0b0r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 09:50:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7e0321ec1so2997289a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 02:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791280240; x=1791885040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jS6d1VPN5H+Nib8Nvayq3z8IMlZlt6USSmNHvwcP2Lc=;
        b=RMWg3ROTCw3JfMNOgjXdfg94hCZGkH/tIwsSM1k0pzuhALbzXFSeHN64wi8axSFbQY
         hF8qrFjVcrftgATRcpgu8MMvOw/PKZjiBjO3R7ijshC2PrZ8BLewQAGWpyb5Pxv+3yRL
         xnrthGcnKcTYaTXg0UvFaw561nI9tKg7VtDS/7BF5lOlvNkXH1lsLNSwTNNR2ouwn7z1
         okG/YFeZMl/heUOn7UPd704kqmbfSJ8kO9nbAcPFp+UVbzG8MEmG+JUIHDL9iI7qMdA8
         I+yCwEHyRqlSSZaPjM+puzsWgAxyYSyiyVlkDzQ47xf+HnhT0A9o0bxBbNcC4nC/8m4+
         TRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791280240; x=1791885040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jS6d1VPN5H+Nib8Nvayq3z8IMlZlt6USSmNHvwcP2Lc=;
        b=UEi7zscjDik/UotD34DCJdgHdBT19ToGKRBA05VXAgIrxHJQeQpZyIFd8WMIMRM844
         JQWQczVUrgMrhbUyS+jWboWl6D9EwueoK0JZ9pHc31/KiABdc6czJrDFhLJhKCaDOGvY
         iR/BgAmhAiCjPPzuZbi4GsCePVPLh+4VWehDEPN8eHhL3mbGuvgX7H1NQMsDtE3nXbEE
         xQFBoEsapvch4DnZvoidLpUZDUh1lRWCMChXEMmFydc60dcR+ZUFM709otPhMW2ZrsLo
         wprKzawBwRgGYxsgZBkJNS/jGdGqqCwp5kqksqyx5ffzqwIHwS93523vyyX85IEyn4f8
         pCOw==
X-Forwarded-Encrypted: i=1; AKwUvBz46rYKtt97duFBaOB+w7SzZJnH0mn5LEE8XqQat89EfzmOqbjbS8xydQP0Fl7IME24Djmati7tsHFHls8h@vger.kernel.org
X-Gm-Message-State: AFuF++mvzuTSYXX8k5Lh2lJJwXVBrY42j8RJpx/vVko5vjyq/b5jCBgI
	fFBj6rhENlgMMjD002XN1Eis0CvGFJQZEVhyppb8xQg4fFyS9OlUqI5UYxfjZvHqWTt7WKzJ36m
	/sUUGnzdGLIsPhcFbODvUcf0sNDFr1QjXv21ypxJANw2lKpfjWmGp7w6YT86Pz+jakcLq
X-Gm-Gg: AYBFou1WvdJofQC/cyw1mgJLDDJlgIy3SPrpQNyvaabINybiAHK4bja+p6z/UR+5XqL
	rK1G49OdfwgveL8/0w8A5CjwFfTFHrFidkywc5TaArXhseji4tBNEN62N2Bi7tKhYCuiK/Vs2Rl
	/P30pOC3/yuXRR3+2UgNNxAYHqtrSSRmpxqibMK+8C9Ahtys/9Kf8Bh8mU/HLJjMtOZ1CJ30Fng
	2dyawMfUsFBc6/LEsL5Ii3/AYCLeFFoVfMbNoa9PKStQD4vdt21h0c9n2BtWhityf6BTWTwWMh8
	JRZJP8cCFLWRolUOVmD/FGteiYoBKTJmfmFHUWPvcYBMmn/kPlyceXJEuKkR2le3lW0O1x27ezv
	fm5ut1do7KYIqfMzmYyRJELNy6UKvyAFp7wj9uN5QFuhbH84dJopKZphXVG5HC3vY
X-Received: by 2002:a05:6a00:2e07:b0:886:9eb2:a9aa with SMTP id d2e1a72fcca58-890dbb8c48emr757953b3a.6.1791280240230;
        Tue, 06 Oct 2026 02:50:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e07:b0:886:9eb2:a9aa with SMTP id d2e1a72fcca58-890dbb8c48emr757941b3a.6.1791280239785;
        Tue, 06 Oct 2026 02:50:39 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-890acde961asm535523b3a.61.2026.10.06.02.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:50:39 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 02:50:30 -0700
Subject: [PATCH 4/5] drm/panel-edp: Add Sharp LQ138P1JX61 (Surface Laptop
 8th Ed.)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-mahua-surface-laptop-v1-4-406fc042162a@oss.qualcomm.com>
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
In-Reply-To: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791280230; l=2528;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=T0lN/DapWPxHvaDW4pJnUs2DcqEFLyYI8O4ONz2Onzo=;
 b=b/ojm2NGZbp0Hihaqkh+5mmrSWAdCRDQ5tpvVjjwOccVEs+VMtJ4T+47nPUbfO9aodCOtSSnw
 g6lpFt2gUT6BTcag8rVkDL0D1ZjjjY1yknJ4QpsQwHYj32yQf4Gxryo
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfX/mdsrTe7LW7j
 CpLttsbk3Q3Rs8f3sk0P5X3q1IBxVNM4KwK6LTUVJUZyroSZFwm+4zVgqvjlwX/6G6kRodsy6Z+
 tjGcNMYqtuAg2SGo5T0l13SGrmLDAG+1D31QLVb1b5uYLxE6b4E1QqCJbnOZfOki063Xzf/2zlp
 RxS4qUL/PHEL2T96Z/NEydD+QFtXN0K38b5tBBPt+L2SEesQh0sS9F4DFnN1Hk3x12M6sjwSDk7
 EES0+0Vz4qmprA88Yk6YEbs3F5OCmLPCGx5zaaGiwv7CDDUoi3Qw4KkX5WfS9DJY5LSG32f9blw
 iObmVf45K/i3Rfte6ooMhsZC8Jlfdd8oWNUxsk29+vKMgBkzx75g+ZwZ0o8otlsqkzlCrY/m/YV
 SL4QhOjAzHh+Gdyw2BBlHu+y/W8lRAHKsd6LxRqd4Pxypjd5daxPJuSuS6li+3WdvgEwHXAYymX
 gBYAA4o/rVnM+rko4Mw==
X-Proofpoint-GUID: 6ieWUXsQWg0xy_BGydNeL0GXV6O5WQWP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfX7KZYCQ3tO4PR
 7tpvIIaYW47HiVo+umbUhWSQBgXEXQF+SkCF2Vn61mSSjCrOnQxc5P8gkK6O7yC/L9Kyu3rAl3A
 ZwN/PtJ9Zt/bpNizBIrLxd9Lei1phjY=
X-Proofpoint-ORIG-GUID: 6ieWUXsQWg0xy_BGydNeL0GXV6O5WQWP
X-Authority-Analysis: v=2.4 cv=BrQIUoX5 c=1 sm=1 tr=0 ts=6ac4c471 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=IFSe4OfV7_kOeEc-bZMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060039

The internal eDP panel of the Microsoft Surface Laptop 13.8" 8th Edition
is not in edp_panels[], so panel-edp falls back to conservative timings.

EDID, read over the panel's DP AUX DDC bus:

  00 ff ff ff ff ff ff 00 4d 10 72 15 a1 31 05 54
  31 23 01 04 b5 1d 13 78 03 7d 77 ad 50 46 ad 26
  0f 50 53 00 00 00 01 01 01 01 01 01 01 01 01 01
  01 01 01 01 01 01 60 b6 00 a0 90 00 2b 60 30 20
  3a 00 23 c2 10 00 00 18 60 b6 00 a0 90 00 56 66
  30 20 3a 00 23 c2 10 00 00 18 00 00 00 fd 00 18
  78 be be 2f 01 00 00 00 00 00 00 00 00 00 00 fc
  00 4c 51 31 33 38 50 31 4a 58 36 31 0a 20 01 4e

  02 03 0f 00 e3 05 80 00 e6 06 05 01 73 6a 0b 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 aa

  Manufacturer: SHP
  Model: 0x1572
  Made in: week 49 of 2025
  Display Product Name: 'LQ138P1JX61'
  DTD 1: 2304x1536 120.000329 Hz 3:2 (291 mm x 194 mm)
  DTD 2: 2304x1536  60.000164 Hz 3:2 (291 mm x 194 mm)

No datasheet is available, so use delay_200_500_e200: it keeps the
200 ms enable delay of the conservative fallback, but uses the 500 ms
unprepare delay of the real panels in the table. This matches the entry
for the closely related Sharp LQ120P1JX51 (SHP 0x15a7).

Assisted-by: LLM
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 5d7d696b7725..3d002d75ad73 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2198,6 +2198,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ140M1JW46"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ116M1JW10"),
+	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1572, &delay_200_500_e200, "LQ138P1JX61"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x158f, &delay_200_500_p2e100, "LQ134Z1"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1593, &delay_200_500_p2e100, "LQ134N1"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x15a7, &delay_200_500_e200, "LQ120P1JX51"),

-- 
2.34.1

