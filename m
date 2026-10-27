Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086428;
	b=MYQRwJQbtS7LQtVyMeLiujokEdch26cKMXnXOvnY4gLZTStHyXLJj+gclsLfFGbQ4nsX
	 jKyWT7e82I0j25Y/Bz40LwjHR55ze2Si5QyeMq5De8W221kYp+Q/I67xrRGfzd1hdlcPC
	 LNjXd7Lc8mHj8iIXxGxXlcowAaTbacd8GT8XsnUopGHsUtPXlnAq86Yqtu8AxgX+f/Dh7
	 HizMUsQRrvA5ANVrRrU51mf3CSpyqRnpzm9colOwRA7T07Y5qzEeJmq5Qe1Uhn0pCEaOF
	 JWwp1LBDuo4s+xzsGYQNhc5ksTEL0CokTu0po9TQCCAajL2Z54vG7xeMtETqgxhviig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086428;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LUky8+UY4A1ouoHmYbRRI8VvQrjTt7MkPoYQfH1OLN0=;
	b=cx+mzaa00spVWpjAVlISI/wIpDrTrRzw7t/hA4k5TDg5Hu1ELaerxnD5fJGmZjAICH5U
	 RzQt1kLqHSJNE6+iMRMRUVEgZlLgLFA/CWNiq1NGAebe6vXjlD1Q8+wz28FdMHjL538fY
	 bq4qt9sMnMFVKIerPuvGRBiQvkrj1vCnjGDCfRHXfM7xwZ99GnggRbdDGJEHVlKPKhNq2
	 MfSkte4YfU9qAMRBggafcqycEUomP9nXIL5EsptQUxD0Ixt6ADOrHsOXBIiVsO/P6fZoM
	 hwaEg0GhDaEk+PwnIa9dbX9HhZKOKs/32QmjLluVqb8Earusv24fUO9j2t6rP2ZjmVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LFrdoenz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VL8Ivxy0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF41606A320
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 07:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEF41606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LFrdoenz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VL8Ivxy0
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5Z9LC1259147
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 07:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LUky8+UY4A1ouoHmYbRRI8
	VvQrjTt7MkPoYQfH1OLN0=; b=LFrdoenzhdtIZmrAlXFAC2BbhCL7NzkR6hdAjC
	dO4aLj8GMuE+tK3fo8P6C+lKak4asz+/sOmY/IeLezIbM7u3cC9jG8c4VTFaVrpG
	GteashzoaWsiYpqRLpWkRyKSuuhL1jMPjwSwdaXZPjtiwD5TsH0kELU60XJ/uqRZ
	unhGQtGMFedrOfGG7a7uPunRvPNtBBYxNLb3v/OCRIuhRBex+g1fqGHWX7iSp1LL
	6XisY0WaJ8RY/yoWvWnk2SQRLg2aIej4P0HlrMwTbSxIZneN85E0ixxvAVeB3vsQ
	yOySjJYLLV+KOTlCbtGKVdAdXZmjyAQx8Mi4Im6ISXLarTbw==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavsnxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 07:33:46 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-458326d2d9aso5589319fac.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 00:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793086426; x=1793691226; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LUky8+UY4A1ouoHmYbRRI8VvQrjTt7MkPoYQfH1OLN0=;
        b=VL8Ivxy0QQEZqq8Q5cYtaLlgrZ9G6C8ncmXXwk8/AQoFPYrqcW+W4DznHpOR9aOKMx
         Bl0bi4xMog1NSBy8oSrYJwCuPhpKvaEkGm7Z2bNXfJv39KeOk1QY/7oWqVzgMPqI9MG7
         iRUubSd+vEl/gpOtcjM5YM4DCTfMhgzocu0MajhvhLfy5MMk6noyfdqWKN9vJdAmzuEZ
         uJgBmNN5jN9xe7DVOAOvVrnhsD/q1ydB0O+Ufn2MblAe2wk0aRmi9gxuUjHTOeXTOahJ
         5NB2frO7We3N1kNo5GEOx9o17GfQeyB9/KZin0h+g3r4zu75BbUMfVdr/9KqInWFBswA
         4wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086426; x=1793691226;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LUky8+UY4A1ouoHmYbRRI8VvQrjTt7MkPoYQfH1OLN0=;
        b=jN7tquOJhPQxKurKENL7XR/btTVECs2VPKwQ9kuMTqcR/67G+A5VPBsBxMmnWtpCDd
         364RAWmWgAcHvAarC2UD0hm/8stE+HYP2eV5/Bgv/8H/SF0O51BntjfBRQ40XevHkuCQ
         M4eFuRSUXEaZLnbtZVu20QuC0sAjbeG2bMG9nzk4BoAXI4lhnecdASzyQ3QywVu/Lg+J
         oOMAWRW1R2bNFLCfQVwrhPIQnyiLwv8psrF3DjnltCUeFDPqjKM3+1pL3MmYCma3ABU6
         aO7B2OtzajkogIQ6i2e86C6pUqUu9akHOQ2rfyrTHGHZ+oohJHOQvrOsH/ZHUondcUoG
         1MiA==
X-Forwarded-Encrypted: i=1; AKwUvByGdN/Fola9gnAxVA8JvNybDaBcDXLQMWk95C17OGfphs4TaHLZFGBRe2C8irJZ7c79mOXmjJjEE2SrSLa5@vger.kernel.org
X-Gm-Message-State: AFq9FYLZYGAroVdugqL7qzrQ/Ll+KpN7upNc8xexLqglGanAQbm7ULAs
	Evx6/z5rd5r1aYC9YZ6+x6m3HVInBaO5+2ZWsktyuRQWAw9yeIMBQ6G9nJTe+pP+DdOfgjvMj5L
	x3vuQEBULP0jm8RAXd4y03782HQehy4c1YEzeVpgdTCbcm9qpFj3dMIUerIKaajhl0GqrzX4H9f
	P3
X-Gm-Gg: AYBFou0zJAREEH5tlM/3+IJ+Tpi0PKwtVOaD5buAGW0aOwI7BoLfk1Awnqs389Kw95a
	9HIJPi0lT8Jg2EJyCccLezaUsOtRnCd8YuMJoC+TpDmNAtAaq7Wx7EBjUj8c9fr+ptaTxVBRczE
	9GPP8FLgWDX6UXDOX//W2pKaatDQhAbVcMhqSZrW0MAnz/cBuPOk7BCwUA8EszrM+yE8zybJ/Tu
	nhHo+QgALSxaOGZrYZzUssAKJ2X0pXD+9GhcpyI+SpBqk7xgMkFweiP8AbZjZqHxZ5NfZ4yLOlS
	iofQ5jqOUvyz9wiR3NjtiUekC6kD7rnl8g6BvaAU82+BFOSL9CON258jiBWrv/uHqbI/6L2vHVo
	6UHZln7Nd95hw7ufbwhZJE6T1DbWF4oEve3wmG9Nxpoo7SLnLfeXYF1FW2oDW9zmA
X-Received: by 2002:a05:6870:2116:b0:491:6c73:817e with SMTP id 586e51a60fabf-4a83f023178mr5401732fac.5.1793086426039;
        Tue, 27 Oct 2026 00:33:46 -0700 (PDT)
X-Received: by 2002:a05:6870:2116:b0:491:6c73:817e with SMTP id 586e51a60fabf-4a83f023178mr5401725fac.5.1793086425544;
        Tue, 27 Oct 2026 00:33:45 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm6181923fac.15.2026.10.27.00.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:33:45 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: Add Microsoft Surface Laptop 8th
 Edition
Date: Tue, 27 Oct 2026 00:33:32 -0700
Message-Id: <20261027-mahua-surface-laptop-v2-0-7dd903a12d22@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMxT4GoC/22NwQqDMBBEf0VybmSThoA99T+Kh21ca4oamzXSI
 v57o732MvBgZt4qmKInFpdiFZEWzz6MGfSpEK7D8UHSN5mFBm2hOoMcsEsoOcUWHckepzlMEpB
 so42qtAGRp1Ok1r+P21v9Y073J7l5/9obnec5xM/hXdTeOxQKwP5XLEqCNGBbB0Yrq/EamMtXw
 t6FYShziHrbti99wIFg0QAAAA==
X-Change-ID: 20260930-mahua-surface-laptop-0ae6d2419240
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793086424; l=2366;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=R8lOvNgWs46pf90ZSJIOyYCIUBLg0i8Yu7waeChRwB0=;
 b=/Slh/EE8QriciPbD0rAQwZWxBwGj6Lcv9FQdIuqdHkglBRA6NBGsaj+NUTQN8K1ZfCuCmsTzn
 UWITgVuFuM5Cuj1R0YbC+iqnfq/C5wnvUExjtMJTqrAoobby8iEoCCS
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-GUID: Fev1KrqisyGK3OgrU3q3bS7FIW8tLGHh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyOSBTYWx0ZWRfX+d+IXelIlNBg
 It9PW4XrOk7kQKtHkCQQGoNAVrKUxDIci0QZIyqJKGF6gVOnmewA5qT/CG2eG0wy33YIdkZCBl/
 WoMmrVH/YqP3zgFbBcdTGQoq7FC6U50=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae053da cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=CzLnMOK7UxEGqh7MKRoA:9
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: Fev1KrqisyGK3OgrU3q3bS7FIW8tLGHh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyOSBTYWx0ZWRfX9zVqXHngsUK0
 MFcw5nZ7MQoBQBMI0tOATXjEku9pBcegQOy8KgNgkLq26i60QEtY0z2io9aLTVBe00hd9gVNlR0
 QbSCUqZRydTPFRgODBJ8YUu5q5mlJhkGDtdJZd9QdTAr9brPRe47R4hi1GnRwE3NS/zFHFNyPqI
 eWSgfwf/s8s5yEDhrg/Vifufq2wItGcEM7rurTzBPMyYq9t7JeozaAqtvQgRueM3//kYbe2QBVn
 b282jdFG8t7u6jmcwkQCImugMYPBWwWDWGHti5MclLPKuwNH11l6vPCpUoEzLJMQlKLCLmnPfNX
 6IDL7oiPAoulLGULR2ezUwO+DMvS1JUQ0g6qiK7i48ZidwU9i2zaQl0SA8yG3sSeJxbui6b3vIT
 np32rTkmq6vM2HYMxNKT/7Qn5zZbNUeov9qctNPaiF6sv7He2GuZdg7uE/CUMf0RNd137RWuJR7
 410LL19vBQMlmfWLfOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270029

This series adds initial support for the Microsoft Surface Laptop 13.8"
8th Edition. It's built on Mahua, the 12-core variant of Glymur with
cluster2 fused off.

As on the Surface Laptop 7, the keyboard, fan and platform profile are
handled by the Surface Aggregator Module over UART. The rest of the
board is close to the Qualcomm reference design.

With this series the laptop boots to a desktop with rootfs on NVMe.

Features enabled in this series:
1. Internal eDP panel
2. Speakers (2x WSA8845) and DMICs
3. USB-C data and charging on both ports
4. USB multiport controller behind two PTN3222 eUSB2 redrivers
5. Wi-Fi and Bluetooth (WCN7850)
6. NVMe
7. Keyboard, fan and platform profile via SAM
8. HID-over-I2C touchpad and touchscreen
9. Lid switch
10. UEFI variables and RTC via QSEECOM

The QSEECOM patch adds independent support for the board and can be
merged separately from the DT patches.

The ACPI tables used to bring up the board are at [1]. The HWIDs for
booting with stubble, which picks the DTB on ACPI-only machines, are
at [2].

[1] https://github.com/aarch64-laptops/build/pull/176
[2] https://github.com/ubuntu/stubble/pull/97/commits

---
Changes in v2:
- Rebase on next-20261026.
- Drop the SAM registry and panel-edp patches, both already applied.
- Rename the board to microsoft,surface-laptop-8-13p8 and the DTS to
  mahua-microsoft-surface-laptop-8-13p8.dts, as discussed on v1.
- Drop dr_mode = "host" from both USB controllers (Konrad).
- Link to v1: https://patch.msgid.link/20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com

---
Gopikrishna Garmidi (3):
      dt-bindings: arm: qcom: Document Microsoft Surface Laptop 8th Edition
      firmware: qcom: scm: Allow QSEECOM on Surface Laptop 8th Edition
      arm64: dts: qcom: Add Microsoft Surface Laptop 8th Edition

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../qcom/mahua-microsoft-surface-laptop-8-13p8.dts | 1176 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 4 files changed, 1179 insertions(+)
---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20260930-mahua-surface-laptop-0ae6d2419240

Best regards,
--  
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

