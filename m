Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AD62DC798
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137616; cv=none; b=eqr1v+LJ0OewzecxdeyUIDGk1rkCzs4sHFR/trFXa0Xn2OgCzRenmN2IG3iE+G9vNiJ5iTz0l5w7N4tqQCwqSign9q5EiMT93w1qUrkflMPHozyiHKh2yhzkCYZ1dv7/+xtBWWmMQ4nyix/eDI/5hHSOQEt8cQzq61oPvgWzcBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137616; c=relaxed/simple;
	bh=Jom/33lMvyROexEXXBka+2wEVnyD992vNREAbJ9xUFw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q1win9aWjXswk7ypLOmj1FdGC8pYA9ehLFJSVap7EYSPpfiedhz8vd4jpwmyYJ4b21YF6ifOI37143szGYvbO0KZRsRzZvbPTOkESKBHjcxhsjpZBz1zwasfYDyBnLEsgZ7PI43QVftPErVBBD3Sn7atKWchNST/AWffKomytGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDftbMo0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M3ZQglEj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDftbMo0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M3ZQglEj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G2ZY1U406092
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=evMqfyXWXTJBLIRuZtTEpo
	fBPLXYO84fBR90qAnHG8I=; b=PDftbMo0OF2PX88jsiOk8q6JCNPYSGHMRXjeNm
	HZ+FziMYkLRrLfXV/Ighpdwv9h90BCEK0jXVO2s1yDuYaeIiDBlwbjqYu3qTqkgs
	VLo5uIDIBJD48BxSZIY+vST4UyBM1gTYOkxZeO6zrZjH+OkLrchX+LskQCLxkDvN
	xAL05Ghmr5lUMIDWvo41+ak7mH8ugtQq1MQqX2LS7tdI1daET8w/SX85vZyG219I
	LBdIbvuFEvktRPYDLS5GFcJRqac36iicMDAnN+P1ySpFYBpLLRJ1wzVu5yztWoAF
	5Bj0jrCNNUPfWcJHvXpUQpPoKonPejmv8MBREPOU6UmNtibQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa2psf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:00:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e49a1d3b1so1366229385a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 01:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792137612; x=1792742412; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=evMqfyXWXTJBLIRuZtTEpofBPLXYO84fBR90qAnHG8I=;
        b=M3ZQglEjFNtDo7M76wZPwGPWE3ojRxncPx1N12wmJN/aqfrZFkbCFS24rRIvQnIN1o
         jPzDAFCQYcoY5hPDOOzHfn5uZY7Vf6TfbVMaSpeM79iESXe7e7LazOA1Mzfb+1h2tMM7
         vBTFM2/c7fd8ffcrWCZGRZrqnq0NUZWzd/9NK/mrCATKnoper75KIWB6e/jm20RO/w/Y
         j4OtQ/4LSt60CkgQWDudL7xsev2mJDG35hlB5RV44e4clV7Ct5x+IrJ+CcTKt4Htz91z
         9fJdHf2ozz/+8mq0W7oCCPjVjWzpXRsO78Ty4pkIHlKNPy581WQMV7a2ACjnYXIPkWDj
         0p0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792137612; x=1792742412;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=evMqfyXWXTJBLIRuZtTEpofBPLXYO84fBR90qAnHG8I=;
        b=N5NZKwRCqUAsb5gDgfzoWCwcWvh61efq83a3R3DThKJz3GL76doMAW1Ul72YHoVEoh
         46B/zv9yGDNjTNx2TmAFhAkV0I6G4UZxSKnByQEehw3423WgjhTi48TeDO5ci0dlaodz
         Zgm1Ij1NVhm2tnLFaGbTbGnW84WOMwFf7jNjW/9p+0rmWaQf7BSGee6WG2z5p1wZKoj4
         RhCk1Hm4EZX4JgI00yr2J8nxdcqjxlPHXBe67PRttvqOnOhbZp6M/xjVTrBn3ke+IiuS
         Aj99m0kAyNeCQ8RJ5glLvX3iZtA++2J3tK+BCSZDfwyt1BEfX/aKYxegpxrUYvWWzoTn
         2q4A==
X-Forwarded-Encrypted: i=1; AKwUvBytRFlIeZDibn1tqOvwJ1XPXynD8QSIJgAUqm3MUGZBhstD/uX3gdGOAJd/oEV/5+5O/Vd7PdWW7H3Ao31e@vger.kernel.org
X-Gm-Message-State: AFq9FYKOD7FlV60k5A1Vzj/wzn0ncYkeSJ5Op3v/sOyyfWZOyTaD9/QR
	n04KlvTr9dyUp40mOplh/rZSNxZjYoDU4hDxDp/zxw6AlOV6xiMWdh5VGm2RXMlZKu/bHGII24u
	q7/DE7J1si473GCtIfBCI71+3Oq/hp3bUZvgeVKi0Hh/ii9TuQbIGQG9nb6osIUbUZnAyB5PO4R
	ncPSLNEg==
X-Gm-Gg: AYBFou0UwZvmHjdrIupYLF5DYU49Zm9FtLUzQlSnLTS6bKq9Z174Shd0PGQHv29Ik+E
	PXVGcSC4EKWVuWlgTWYW8NZjfs19rxDIgloVC5+j8ujBNBLKDxO3NlbZ0dv4zbCESQMMDBzFU3/
	//w3YA4mEtY7tlW3TjP/7WDfNBOpohWTjtcndCT3wBqsuo26MHiAI+v6ZS096EP2vg6kr8PL8Q/
	iEM6zJFbgEEjkHYPs5FZFoIbg4oo5bir91P7mvPlOcUDU01TkeBGKp0QDFH/HotiHPXhlyECGms
	R/fBH/uNtDSgWx3Paq1Ah3Br6pRBfMYjXwFFvWItBqqxR/MJ/djhJiRMx9LAUt1P4Wm/LE6Eva5
	JBYHrJ8lLnoxaFrvB1znfrp7jMCkwHK2LX0c6O2N83dCPDjbf/y6qNngMGBbDdxNfBUfo0V/DHa
	VcdbuBAFWkrLdxwpyZ8w6bzcBwVCcZdGX0YlA8suZu972+6GKH9ro=
X-Received: by 2002:a05:620a:2b42:b0:93c:8e3f:3036 with SMTP id af79cd13be357-93ebd0a1ed0mr3577119485a.4.1792137612496;
        Fri, 16 Oct 2026 01:00:12 -0700 (PDT)
X-Received: by 2002:a05:620a:2b42:b0:93c:8e3f:3036 with SMTP id af79cd13be357-93ebd0a1ed0mr3577113085a.4.1792137611802;
        Fri, 16 Oct 2026 01:00:11 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5402:5e0b:9ef0:9b5b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5942sm5471446f8f.16.2026.10.16.01.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:00:10 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 0/7] i2c: qcom-cci: Runtime capability detection and
 improved read/write
Date: Fri, 16 Oct 2026 10:00:08 +0200
Message-Id: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIjZ0WoC/22Nyw7CIBBFf6VhLQ0MpIIr/8O4oBTtJPYFLdE0/
 XdpTawLN5Pcm3vOzCQ4jy6QUzYT7yIG7NoUxCEjtjbt3VGsUibAoGAaNLUWKTY9VaURSgqmtQS
 S1r13N3xupsv1k70bpiQc97LGMHb+tX2LfG03MWdMfsWRU0YBjhUHW0oF+tyFkA+TediuafJ0y
 KqK8INzseOQ8EIdhYCilNKIP/iyLG85EpEA+QAAAA==
X-Change-ID: 20260929-cci-imp-8ba384309942
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfX89ky1PCzXBk8
 fZZEr+jsgFaiBlYDXY8fpVwtCGhe8PcVKicDtyyceIFdBi6QmmJjGkB+fEPDBmMGUC+eo9XYMra
 EOuyvw01zx7O5aTmWXuQnj2Y86eM6Js=
X-Proofpoint-ORIG-GUID: n2tmspxJGDdzWPMEsoFwMR9Oj1wiE4A-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfXyBftvnbkZYxZ
 b915k4jzt8LEEZ432FBMz3Qz/QYyhb1jwR+/f5nrWR/P3osCn/+sVf+uaKbJ8qAKrwnZYYuadnu
 i3myF13nloJf7g8pA6Q8c0xyhBYtbZv6Qie5SOF/hN1e/1qeYh0V1/SAGoB2Sd/eZHSrI2eWpz1
 a36icl1YcYtQOQqNtOCavs5HSbc6yMT/3R0scTJKT3l/F1m7G+RdQy6kz21pHAMHWsMJU3quyQl
 6mR2eb0PoHSD8AshLZcPltSJX8X7rTR4fHDDNx1Lw4bR0pPtu2+tvX5b1HNRi584wiNUH7sLPyw
 OEaAXEK+oslT/2+ZvySIi/ECNXwrB3eIpbj5Bot+Pf3MGTGLgcGYwDYvh9uOTlzgNu+dyBi1tCx
 B2SyeLfd73FFJQ/ObYBIHGGeWv/bvytKdop52T8gsq31E2CuYaxVksyueuaUFYBfZGOzsN2dAdZ
 d5PWKGf5Q/cQ4TjJttg==
X-Proofpoint-GUID: n2tmspxJGDdzWPMEsoFwMR9Oj1wiE4A-
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad1d98d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YGdjDy1V9CnC6BiKI58A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160031

Improves the Qualcomm CCI I2C driver read/write in different ways:

- Capabilities (queue sizes, max transfer lengths, supported I2C mode)
  are currently hardcoded per DT compatible string in a handful of
  cci_data instances. Replace the static per-compatible structs with a
  single version-sorted capability catalog resolved at runtime from
  CCI_HW_VERSION.

- The driver only supported single-command writes, capped at 11 bytes
  regardless of how much space the command queue actually has. Factor
  out the write-command queueing into a reusable helper and then add
  burst-write support, chunking longer writes across the whole queue
  instead of a single command's payload.

- The FIFO read path hardcoded a fixed 12-byte limit unrelated to the
  actual per-revision FIFO size, with a special-cased drain loop.
  Simplify the FIFO read/drain loop and derive the read-side limits
  from each revision's FIFO size.

- Add burst-read support using threshold interrupts, allowing reads of
  arbitrary size by draining the FIFO incrementally during the transfer.

Also add overflow and underflow IRQ reporting, as queue/fifo limits are
now derived from the hardware capabilities and exercised more
aggressively.

Unbounded writes, which refill the command queue while the transfer is
still in flight and so lift the queue-depth limit on the write side,
build on this series and will be posted separately.

Reads up to 4 KiB and writes up to the full command queue depth (451
bytes on this part) were exercised on an imx219 behind CCI v1.8
(128-word queue, 400 kHz).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v3:
- Reject a write longer than the advertised limit with an error rather
  than ignoring it. (Bryan)
- Build the command words with FIELD_PREP() instead of open-coded
  shifts, which also documents the per-opcode field widths (Konrad)
- Actually program CCI_IRQ_MASK_1, the RD_PAUSE bits were being ORed
  into the value written to CCI_IRQ_MASK_0 and so never took effect
- Clear the per-transfer status on entry and stop reinitialising the
  completion in the read drain loop, as RD_DONE can fire while the
  fifo is being drained
- Link to v2: https://lore.kernel.org/r/20261013-cci-imp-v2-0-6873326b44a3@oss.qualcomm.com

Changes in v2:
- Split the HALT_ACK reset fix out into its own patch (Andi)
- Fix a typo in the "Detect capabilities from CCI_HW_VERSION" commit
  message (Andi)
- Use GENMASK()/FIELD_GET() to decode the CCI_HW_VERSION fields (Konrad)
- Derive the number of masters from the DT i2c-bus subnodes instead of
  encoding it per compatible string (Konrad)
- Add burst read support via RD_THRESHOLD/RD_PAUSE IRQs
- Link to v1: https://lore.kernel.org/r/20261004-cci-imp-v1-0-227d12cb4829@oss.qualcomm.com

---
Loic Poulain (7):
      i2c: qcom-cci: Factor out write command queue programming
      i2c: qcom-cci: Handle and report queue overflow/underflow interrupts
      i2c: qcom-cci: Detect capabilities from CCI_HW_VERSION at runtime
      i2c: qcom-cci: Add burst write support
      i2c: qcom-cci: Extend i2c read limits based on CCI revision
      i2c: qcom-cci: Add burst read support
      i2c: qcom-cci: Build command words with FIELD_PREP()

 drivers/i2c/busses/i2c-qcom-cci.c | 464 +++++++++++++++++++++++++++++---------
 1 file changed, 355 insertions(+), 109 deletions(-)
---
base-commit: d6dc536a4c8bb99dd822bc349a9e801be7ea81c9
change-id: 20260929-cci-imp-8ba384309942

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

