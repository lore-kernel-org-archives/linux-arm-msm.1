Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592526;
	b=AYvUzaUgzksKqFrciybkKUHAsMOQYFK+U6sTwCzn7RBJqr6wvrhMSpiV5lrgvBOtwBKG
	 /Y2FMPHIRZHpt7LgnxGA27Q22ZOCXOcrRQGTq9lIJZABslBlI9X4ysXTXBbelkC5ZGTJu
	 dZKDk5PA+d+fYMiJMf+4aF3jE2tFZGf3HNxRtMH6hxC3wCQDllL5C86VMLq3Ha+TSrFsx
	 B6PzBAd8F+B48R85bq5xgO9naUUPCr1BfYzgleThsxIREzmp2iZdNKjKzpv1TSqRoBn1U
	 RnuipcML6binUM9q065S8h4AXngK94/XyJlybMAPVEAkJK5cNc3CTcfNqKj/KBzDjaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592526;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uY7GWI5QIyzAWEBLfUN/IGVontugXjIcJCsl6jocYRY=;
	b=3ew5fPUbzTSFytdFJLNd5A2RTKd6o1JkikytCyMkBVUZ320TKKh8aZn3+GS8scn3FRcH
	 9uYU1ilaaTD0oOzhOPTBBb6hjwJGElk9tlcBwCCMFURdOu4GZYjnX2xsKW9tk5pXVItgi
	 oEVPxXpkaJzuo9UntTkPcYzXmw0GaAT6L/m656rLoPv4L1GkwiPqkCS2uPB9KrBwg6dY/
	 UmQ4lk5IkpkpMNvjb7Jp10GKmvXUcvL7El4KXRgNyio2DYMt2Do5+yRvE6zVNLv7VeJlA
	 BSE7WOHUv7xD3NkHLdrhgxLO5XqWM+GwOAV7UMSsjICOq0kIcJnhL2CRLTuemyrV/PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="XVMDFT/t";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CsFSW+0y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE46E606A329
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE46E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XVMDFT/t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CsFSW+0y
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFL4X1315347
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uY7GWI5QIyzAWEBLfUN/IG
	VontugXjIcJCsl6jocYRY=; b=XVMDFT/tYvv2HSMzR+bLrJ0MWGWXNX8HlXIHHR
	09uruKxVqT+rIUDIKTngbOpYo83A8597ICwJgAFSXaXWFf3j7ubPe+uymlGR+6L8
	7DpWZZR+6H+4kJOSvXX1yjSfGywWqTmyhdwGw6rrpTLKAHoI4TZHgEi0YMr9+Psq
	6FIfGsfPlAxLm2oCSLDb3bxDdmC8RlCozcmN96UEdoJrzpY7YnZggF8iXTgyQiwg
	eJctNKjAKBvzINShEQ6ZsdVCXaxl8CBNEVYbZ23+e7aquqDxK4EcgSIiJIOamXSH
	3a9guUe5jlN+jChNns3M3Btk160ZeIXRv9Dl0d+hYZ4ZmXPw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs03juc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:22:04 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34e650cff93so100317eec.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592522; x=1793197322; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uY7GWI5QIyzAWEBLfUN/IGVontugXjIcJCsl6jocYRY=;
        b=CsFSW+0yFion35dvtQlke8Avsk0ZCevcXciqW+Zso+jM0fBau4cS4W8hexhJLNhu7c
         xklBaki4RPCnCa4jjvOWY1xuARD3i5ql/2J2VutyL0NkYaGx2DYFWRotCKJe9nO1N19b
         85NEkb93qmmRD8OZASltnZlx4fv/gO4Eg+p8TbwVjClpj4M8v5VroRoxUbQ9buMNOSZj
         YHVhyk8EKySZePnP+54oLIuNu7gHxu+CNhLN5ADWyoafc2Kv0ECgUT6UX0j0i9JZuEHr
         +Woy9GJcqcmUewvc7R8uZwwZhGEPoZjjCpil/yfgkqS367JaOwdQIGtyF1MHH+d6F1oR
         f3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592522; x=1793197322;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uY7GWI5QIyzAWEBLfUN/IGVontugXjIcJCsl6jocYRY=;
        b=FU4i9DwiNEfNZyD0Yw7hj0LhnB8Brmjnzgqh4u+8ymiCWeTtAe8cotZfdIJC2hZNRG
         c4yb4AUQTCQpLK9bJ4p7R2v3TumjobunJf7nwVUOCTR8qWd/K35uw2VEqH79vsviQIBx
         0LQILQi9hIJ2vLR5MaVb43cIbHSs4WI11rT5AgPh/xeoCWpzSe4DBwh6V85o1FjnvABo
         Ele5TuGo1QoszXc8k1vpxGCKvwwaf9Kx7BFca6xgMzIW0UwcHN1Im2aB8QURis8NO57V
         3uoFiU+uo+mdZ9zju//ymv+FhBqDm2A2tw0AvTtD0Atm+Q+0Gvt4I/1/vzv7+n/AUdus
         geWA==
X-Gm-Message-State: AFq9FYI6Fj6xjbPkhaHS9FXTXEXQJdCN23UFI0NbUaCLubqsTwWx1I1e
	QISmbozFF/S3W/bLQdPXeoaUuKcNsNv3UYp5xn30U1J3LycYUUBam5HnFil8d98gf+uesO0s13e
	V5ARX7AEzdTCdG8ZDxjjPjFEtMBo3ujOchAlBGFDkxtp7vQqwHw8lLyg7QVLwERnax1lI
X-Gm-Gg: AYBFou1sEJkV3VoObNsyUuAoCt1yFSQM4x3Ei4jzL4IP3KyoNBg3Kr1os08h/cdXb1z
	VY2qJEOLSqUqI2dc92SKasNiRkwU7oATxkfo8J7zaSdhp+nL8bbni+BVb3/hlvAs7F+l6ImoZMz
	51HLJ9LuenDCN5bPY0sE0GhGJu77nyAGgBUvrqJEedFhhGWNtW/BD9AZZYLgJZxn31qT1HmjA1H
	fHLa8O5akswkUZ1hI4T6PdLo187zxO8CeTFVjUYZjietKClQKos0qteZDmYcPvp5iCz85rEWIML
	9G2JrBkrMwcabXJiu8sqO0s9FO4uTj49lja2wnOyInsvt6iwWlj7ssWUIvjYvPBRrP+THk6jq5o
	M36YWL3Zyq/bIw36WZbCbB3lPa3SkAPkf8P31V9jwLvp1ucOiy2hUHs7gAn3bNv69h7lF308iPU
	uNpG6Fterr10qvjxtLQKUSBONB9rlQmMNNWDwXGQJf7mc3sT8uWww=
X-Received: by 2002:a05:693c:638d:10b0:35f:8c5d:5938 with SMTP id 5a478bee46e88-3674bd455c5mr5364013eec.1.1792592521888;
        Wed, 21 Oct 2026 07:22:01 -0700 (PDT)
X-Received: by 2002:a05:693c:638d:10b0:35f:8c5d:5938 with SMTP id 5a478bee46e88-3674bd455c5mr5363948eec.1.1792592521142;
        Wed, 21 Oct 2026 07:22:01 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:00 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Subject: [PATCH 0/7] arm64: dts: qcom: shikra: Add display overlays for EVK
 boards
Date: Wed, 21 Oct 2026 19:51:43 +0530
Message-Id: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHnK2GoC/43PTW7DIBAF4KtYrEs0gPmxFVW9RxVFgIcGxY4Tc
 NxWUe5eHLe7LLoBPSS+eXMjGVPETNrqRhLOMcfxVAJ7qYg/2NMH0tiVTDhwxYA1NB/iMdl9F/O
 5t9/7ccZU7kwlk96YwCQ4Qcrvc8IQvx7y+27NCS/XMmBaH4mzGakfhyFObaVqXQcLGgJ3Bphwt
 TNaFExr6YwXDhUaa/1CD5izfTRrq+1SDBoBv8VoN9G1eKazpEAN2qCksYDCvI05by5X2y9TN+V
 4fcqVPeUf9zmm4wpJBC05506B/TcEhvZToxjzdNZ0ZrpADE2QZU0eWPME2t3vP6sVWbKWAQAA
X-Change-ID: 20261019-shikra_display_overlays-515c88f150b3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=3439;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=Y+zJhUSQ15wVjj0ICYb4OoQC+kv3UWa/33obn42FQiM=;
 b=6YaquSOSb9Af4655/GhnWH7C6gUaVnevKEJHswXkwk3wNVypVHgvy5mEOinv+7w1To1V0UrWf
 hBt33ZiFNEWDVMfJh3fGJjPuuNaaouOFXQRpQW9cmS4e3IuLDIgnoWR
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8ca8c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1DmlGK3jZovgR-jo5ScA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX/CuNFSMR1AdN
 90Rydo9Kx6/7h8oXPe0Kl9XZpiHHR6txu3I2CRpN9HYsnoqHtfy84h45QpqeFFQavRpKXnTq7Pg
 CYg6Sl8CsU9nzUArmAxX3z/eTW5CVvfrmQG4EoppfP3pA/qWBnzCcNCsvyL1uTsF9hXw51WljIH
 WgEYhqJaRAHFs4PFfEwB0tgzUhFXqtrGfJ808NsjDJuCxz+Nss2cqHDfDcubDbM4uG7KgXGuJdm
 QKLkl7tYzN10X/Fi0OSSQXpKTo4orX9WPHooSGFhr5gJkXxu7O9wiUVENwH3/L2hg8TbHooNe1W
 0Po1XqUbxwRznc4L7uBEZx8qF0FA8N352FQ8ejsiWdakzjjchaaIcq0HkQZseBQO9yYiqi7eQX1
 /7V1UyJuwxc3l0eT5dlUUgYmuznYZZDGk4jJBV4oyU4LjVwzx+EOVcaMwfj3L3KnS05K1wW16C+
 KBfAyL68baG0+oQAKZw==
X-Proofpoint-ORIG-GUID: HHgeQZsQdOlovczwS80-VKVf0N-Xr-Ov
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX0ojDha7qJOBA
 cFF65efdOdly6+Xf2S8Qov9ioMdzB3NKn7FSwu0H4BgimTAlQ/tFJUD6vJ3SffaVHbQ771S9j9o
 tqGQmbuxMypguPftD29dSchL/zinmiM=
X-Proofpoint-GUID: HHgeQZsQdOlovczwS80-VKVf0N-Xr-Ov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057

Shikra EVK SoC cards (CQS, CQM, and IQS) are mounted on the Lyra carrier
card. The DSI0 interface from SoC card is routed to either the 22-pin DSI
connector on carrier card named as JDISP1 DSI0 or to the B2B connector
named as PDISP1 DSI0, though a MUX which can be selected by a hardware
DIP switch. There are multiple daughter cards designed that can be
connected to this PDISP1 DSI0 B2B connector.

The below B2B display interfaces are enabled by default in base DTB:
- IQS: DSI-to-HDMI using the LT9611UXD daughter card
- CQS/CMS: DLC0697 DSI panel using a DLC daughter card

This series adds DT overlays for additional display configurations:

- shikra-cqm-cqs-evk-hdmi: HDMI output for CQM/CQS with LT9611UXD
  daughter card
- shikra-iqs-evk-dlc-panel: DLC0697 DSI panel for IQS with DLC daughter
  card
- shikra-iqs-evk-lvds-auo,g133han01: AUO G133HAN01 LVDS panel for IQS
  with LVDS daughter card
- shikra-iqs-evk-raspberrypi-dsi-7inch: Raspberry Pi 7-inch DSI
  panel with touch via the 22-pin JDISP1 DSI0 connector for IQS
- shikra-iqs-evk-waveshare-dsi-8inch: Waveshare 8-inch DSI panel
  with touch via the 22-pin JDISP1 DSI0 connector for IQS

These overlays are applied on top of the corresponding base board
DTBs.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Anand Tiwari (1):
      arm64: dts: qcom: shikra-iqs-evk: Add AUO G133HAN01 LVDS panel overlay

Mohit Dsor (1):
      arm64: dts: qcom: shikra-cqm-evk, shikra-cqs-evk: Add HDMI overlay

Shashank Maurya (2):
      arm64: dts: qcom: shikra-iqs-evk: Add RPi 7-inch DSI panel overlay
      arm64: dts: qcom: shikra-iqs-evk: Add Waveshare 8-inch DSI panel overlay

Vishnu Saini (3):
      arm64: dts: qcom: shikra-iqs-evk: Add DLC0697 panel overlay
      arm64: defconfig: Enable RPi touchscreen V2 regulator and ILI9881C panel
      arm64: defconfig: Enable Waveshare DSI panel and touch GPIO drivers

 arch/arm64/boot/dts/qcom/Makefile                  |  15 +++
 .../boot/dts/qcom/shikra-cqm-cqs-evk-hdmi.dtso     |  90 +++++++++++++++
 .../boot/dts/qcom/shikra-iqs-evk-dlc-panel.dtso    |  78 +++++++++++++
 .../qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso    | 127 +++++++++++++++++++++
 .../qcom/shikra-iqs-evk-raspberrypi-dsi-7inch.dtso |  91 +++++++++++++++
 .../qcom/shikra-iqs-evk-waveshare-dsi-8inch.dtso   |  77 +++++++++++++
 arch/arm64/configs/defconfig                       |   4 +
 7 files changed, 482 insertions(+)
---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20261019-shikra_display_overlays-515c88f150b3
prerequisite-message-id: <20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com>
prerequisite-patch-id: 7631efa76e1fe98ae45c0f68e93ced4c523af27a
prerequisite-patch-id: 49396fb33427bd9b9214b537221a1c582d5d62ee
prerequisite-patch-id: 3cbb70da0a3009a2730813b562c29f432bd0fd8f
prerequisite-patch-id: 1c9ff594613a4cef8d605cfd37a3270866ba6414
prerequisite-message-id: <20261015-shikra-work-v5-0-5e075222b60a@oss.qualcomm.com>
prerequisite-patch-id: 326d8620d592d8f5f75fe62f88a2cb4dd8ec0b46
prerequisite-patch-id: 327308970dffdb2b218d4834e1badcc9e05cfd01
prerequisite-message-id: <20261008-lt9611c-v7-v17-0-1e8f5f2b2f19@oss.qualcomm.com>
prerequisite-patch-id: 49f1e01bb5594ce9c4301ce4b16715834ece7f41
prerequisite-patch-id: b909fe50eb311c7d8ca6778a29952e2c1a28d7ee

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

