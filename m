Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B004A3D6487
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 13:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478816; cv=none; b=fepToehO3gXtmUguH4EnL2H4LMogTzYz9rezNOuEbt3b4mnXwGhdZD+ftGUlkLHo/ma2J8Ta1JvTtSmCXew7R3qQ+U3T4eRXTTSKtnwEVvVWONZgxOXQUn/X+v7fRDlw8behRupuPExjLGSCckC/m9FMusyyzRN//odeHyaE2gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478816; c=relaxed/simple;
	bh=iYf0Z3IUg5KR7a1qHZ0mBPi3Zdla7UuK7O+KESklDX8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NPiM7cs5vnzZ7hZyIB68I1MFhSENs4mhA5G92e33UVnINxNwL28kEmeRFEquMG0wg0mZQ/Kc4Jmqa7IfaJYmMwnkvaEx5bRFLV7m4SQbf3NNTSYoM4lSI4bWOEiLC/F+8oWJiYyrPMtTOfUkNeDyrorwY2DDyJ6IMTIA38guJjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kjtMXzNq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eVnT7rZ6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kjtMXzNq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eVnT7rZ6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FCxsmo3862615
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 13:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g2OwLyaZtMOAIiCLuhR+Wp
	6NOjJhPYFA3tdfLkK+WY8=; b=kjtMXzNqi7yhVkilmzo0cTMPVSWjw4C1hv6fBf
	lNzwrD7cYwv+izQOfKOgrICB9p7KxkOWec2qfPq0UYWIA5FEAvn3oc2TXF4sPJcy
	GRXioYi3Lui+tAOJFB1ru7fHX4RMrocZ77FcvQqegQdP8D+ueQhua6JLPppcvcZA
	UDIycYpji1PEQcW7jLsjNPC9ILk3w8FDQcrcLWO90RIFY6WXSwiT6ow0vml9r5hs
	j8Z06Z6Iq6UylZSg2I0P8RVIaykyIgWlbHcwlYvCykN4dwnD/vvBG7DVtBiFdGWG
	hVOgltZOOETEoa/apZQUYUnKzd9tvYiR8bFnYevMO3pvL0qw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc17pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 13:26:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a07b5b5efso181902885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 06:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789478813; x=1790083613; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g2OwLyaZtMOAIiCLuhR+Wp6NOjJhPYFA3tdfLkK+WY8=;
        b=eVnT7rZ6ldkKU8tVSG1vNm4K2BIf/UKH+2Xf2nJuUnXCch54MhZRwAblL4DPXZM1sC
         67tAZeofa3mo8o+tbI9BLJ6T33FHSwztcks6qG5N3KwQ5WRmJIujNuiMbCc7ntyrzJiT
         4WIgeby7MLG99heKbdG5nZZa5z8NnFXG/xt+Ir0pEo6zBXa0ec0RmYPtWwb5K7f/Fypt
         kZPoUPb9cQVfHZpWgPmGiAydJE36vbpWoabKo8CYeidLQYg84B3xPiajBi8zGZFzCh/c
         me/lFfiLCVBHj6WrypsWuWH+0VCIOFFlE1EOp+GQAZiih5tRmxnSlMhAt4NZXh7qQ/7Y
         8R7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478813; x=1790083613;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g2OwLyaZtMOAIiCLuhR+Wp6NOjJhPYFA3tdfLkK+WY8=;
        b=Q9BDZlBLhTpZ5B2/mWAJLpvRM/MdfkGZ90YmgraAVGKzrTD26XE1hNk3dW7Zi7Ad7q
         +nEVgSjVJOE4CTzRkJ1dpiPFof+tVNRimQWcv5E9TJV4juwXorDywv2kg4Tq2bUGF14y
         tzOl9zhQlMw0qVn62T2PVsQRf3sllFniwqRQmclo/NAkY24jn76Opj+YT27wcgdwFDnY
         NQQK6/ckmjf20LQbMTFi32xngwD5M0x6Z6glpmjCWg/K9SzeDHpcf+NYP4CBKUoDSoBr
         7iQ5HsfrTTzeA6UTHF1NKNtw6ri3i0B24fjXIfAyQ8dFb6FtQrwdRHjE7DsnVpVJ2UIG
         eE9A==
X-Forwarded-Encrypted: i=1; AKwUvBwMZUjOaYdLI3lmQ47rB/L2QZZPcKlUwR3yoDP9eK6MqbVLjJpM1M5C6QQzNkeJMgVVK0+mZzohRiFlKsLG@vger.kernel.org
X-Gm-Message-State: AFuF++lAb14jLXWZv63bdmG4JnYUBkid0xk+hmtaG+A0oMvWobIwPra9
	Tu60AuBT4srJFnj2wzQd/HPCn1bc3M6a6RtoyPSoVK8hsH5lQuIEFgEfwrGrIXqMxleIyPPkZQG
	TPBux2vkp+72zx0j3ch8g63z2ulK6zi/8HZqRKXcyIxGj6FHg88fxXyjdwFrxThg06lag
X-Gm-Gg: AYBFou0Rwsqnk9vrwEmfzQJbmgsaN1A7wjwvFQJET6Iq1Qe19xBd+v2xHrhIkV3g0j7
	bh2P1c9jz7LB1OjXm+a9AMNoaJgv7HOgF+YFKXewd/Jw5BCDPP3hdNOihHPiJK4W9zAxPTJ+Iwe
	A8RPOc+XL1OFAzT041sQpwO5h+xDjf7zTHhNlSh0W7+ZAlqOnmf9afLwaLaRCnjqV0GXbRKldRT
	XLQIzy+fWT7dKv3rNcA+3sXBJqgr2d/JwckHhNmY4hwre1PiLakTZRndnOojGYQ2SCrOoy9SzTY
	NAgtAKZH0BBc4bC4YtRzfwngTMCI74DUbCzcL/DGaXjAKW9V//D69il1FHatfuxaQW+r3jSrrow
	JU9X4PgwRfLzuiNEEwnqGRd0jD4KRYOs6kegX
X-Received: by 2002:a05:620a:6914:b0:939:f861:8836 with SMTP id af79cd13be357-93a34647d22mr466463685a.20.1789478812788;
        Tue, 15 Sep 2026 06:26:52 -0700 (PDT)
X-Received: by 2002:a05:620a:6914:b0:939:f861:8836 with SMTP id af79cd13be357-93a34647d22mr466459385a.20.1789478812305;
        Tue, 15 Sep 2026 06:26:52 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80bfc90sm1248906185a.37.2026.09.15.06.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:26:51 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v2 0/2] qcom-geni: Fix QUP Core ICC votes
Date: Tue, 15 Sep 2026 18:56:26 +0530
Message-Id: <20260915-correct-icc-bandwidth-vote-constants-v2-0-f78eb611204e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIJHqWoC/42Oyw6CMBBFf4V07ZDyCBFX/odh0ZZBxmirnVI1h
 H+3YNy7meTk3twzs2D0hCwO2Sw8RmJyNkG5y4QZlT0jUJ9YlLJsZCv3YJz3aAKQMaCV7Z/UhxG
 iC5giy0HZwFC3UhZ6aFBWWqSpu8eBXpvm1H2ZJ31JO+v22hiJg/Pv7Y9YrL2fsv1PGQuQMGhMV
 l2Zqi6Ojjl/TOpq3O2WpyO6ZVk+32jmp/EAAAA=
X-Change-ID: 20260908-correct-icc-bandwidth-vote-constants-49001bf6e03b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789478807; l=1532;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=iYf0Z3IUg5KR7a1qHZ0mBPi3Zdla7UuK7O+KESklDX8=;
 b=d08jlEM5VgBRvdC4T7g4myaKphJkeogjF77ziBgbB+C9u0cB2ARnLUAAiAyEv4s6k93DgNN1B
 FvYamBUVSbRCCy2N0fCJFKGBEf3Zq/KgiZ+RuTPb+ccXpt6wzymbL8+
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-ORIG-GUID: RdBbQNLdtGGc9Fcha-FrxTDqmgzJ-nEw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE5NSBTYWx0ZWRfX515k0f+FLsAB
 DzzIAgowrKOW07XUdcjxX5iYI1Vgg/yOxL07ZQ4fpFmqH3Ds7tfr1T3pFAValpVGah39AISRGpC
 3ixvQnNa34jvLCYrFJs9X+aFpXNp150=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa9479d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=MOdl1PVcvyPrLPiNne4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE5NSBTYWx0ZWRfX9CHgQJQ2XrMA
 /TgezqPS+a0dXQZycdZaNhM2ueZY5xBF9r0fW6Fl/Wl0sE9yMGotMjze7CwrijwoXNv+Lh7nL5O
 9JYgO4+RWe5wuAmkCGxj4OouWj6Gg0UB628/A912QFaVXNCMjoNnxA+2ykfh6NTIaLgmByfez09
 riNP9+GfhPEymymYzw1IUE0RkvWnxRZB91pH+G0jDqJSnywdscB+OatpNgDE6cLA+/b/WRhJd+y
 tzZH2I9hH9G+NGBJYG4OpWk0lMCO9Re8kiS1hD3Bh2mcwDLtD4anAgzzTEm7WhLoxaUn1+qh/Tf
 TgJIxpPDY8BM/aROvNeuJQd+qPOesMfw4tb4dneF96p5NF+gHp4IeCL6i3jpPMVi+kwvz4hC/Rs
 2xXtKLur/aw1zgXlShOGgi4CVRvqibQL3wB5BfgOz6T2w6K2PVaj0L4/pGMdurBQkmGluDHM1Ev
 5NigLeg25W/R6mpuyTw==
X-Proofpoint-GUID: RdBbQNLdtGGc9Fcha-FrxTDqmgzJ-nEw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150195

The GENI_TO_CORE ("qup-core") interconnect vote selects the QUP Core 2X
clock rate. The Core 2X bandwidth constants currently contain values that
are several orders of magnitude too small. Also, at baud rates up to
115200, the serial console uses only a 1 kBps keepalive vote, which does
not request a Core clock and can leave console RX unresponsive after the
system enters a deep CPU idle state.

Correct the common Core 2X bandwidth constants and use the 19.2 MHz Core
2X vote for the low-baud console path. Higher baud rates continue to use
the 50 MHz vote.

Patch 1 corrects the common Core 2X bandwidth constants. Patch 2 updates
the serial console's low-baud vote to use the corrected 19.2 MHz value.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
Changes in v2:
- Drop the unused definitions.
- Remove parentheses.
- Link to v1: https://patch.msgid.link/20260909-correct-icc-bandwidth-vote-constants-v1-0-fbebf6b3c341@oss.qualcomm.com

---
Viken Dadhaniya (2):
      soc: qcom: geni-se: Correct QUP Core ICC vote constants
      tty: serial: qcom_geni_serial: Keep console RX functional after deep idle

 drivers/tty/serial/qcom_geni_serial.c |  5 ++---
 include/linux/soc/qcom/geni-se.h      | 15 +++++----------
 2 files changed, 7 insertions(+), 13 deletions(-)
---
base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
change-id: 20260908-correct-icc-bandwidth-vote-constants-49001bf6e03b

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

