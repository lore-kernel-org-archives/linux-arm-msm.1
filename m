Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542427;
	b=0ypd6hdbUs+O0wxboKVcwvZWOg8f8tnF8fFM01O41L3fUWTo23kS4QEmX/DiWtneIIXA
	 MS9783ttkM76XHW9uAsFnsAcC8yaoZCADX/a6p5S+M7yQlEbV6Vxc51lCj/LdNdvDv0Bs
	 smQUgmwPxXn3silKupCcfPmMw7Cy3bmrvzYHQDu8TCy4LYV0os/Ewb27yfOhrXAJ1dJHF
	 4svRBUJYKmqJWULGUmovAKhgMHfS6yhzEpjNXJ0zuinPLwuiS8dfMkxdFDenqTAWQhlMK
	 oIJQWpwtEyOGV4HA/SS6S+d6RGffenMz2a2j34LREofIsr7/N2clihlQPlRpVvtVa1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542427;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I4c7gySEPALfuGRpMlxKe2GMzkyCSxx7Y7o/mw/q1AY=;
	b=Hj/RA03PQfv3ZOfhhalmjzutxnO1DwZZTqkoEu/49g2VqwQ/1/Oyxzzk7L+Mg1BMDqcd
	 h9F8MpSG7GHdxdg3YwohPf6H6eXhNxJe7ZgsPvuDQVtkDs2ZgJIYL7F9g9/t0QhTYZAoZ
	 JVSdLxJwvXT0lG3IT4O03kAG6oqi7sbsN9YlXRVVXhGW0CgSZxtB665qDQSnjXoPd3v0i
	 keiPnYSRkCu1zb5JBxBjo8/45P/SozTAKIew1sIru5gJDAoFOz3eT0RntfTbhCZ8FAzZA
	 f/BkYOfinxwWDjl9w8pWsWn7SAcFTOxQG1NumDLWjy87OX85NKL0flsib6+Xq78hdyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=opMZDJm+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fgqgnHE5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6613B606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 17:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6613B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=opMZDJm+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fgqgnHE5
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL5LT2317959
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 17:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I4c7gySEPALfuGRpMlxKe2
	GMzkyCSxx7Y7o/mw/q1AY=; b=opMZDJm+sQVaeK/WFwZx4EDxDBH6gvuzqo7820
	+YhiKvgZAWVLP7uWMTFn5tKXp55Oj1ToVNRlAtg/lmCBePNe+SQUaPY6mDsVTYs+
	nia1skn0EFk5u+Be8hqiivkO1UagrVSnfgZZBK9cHEss9bk8plgnO9meiHZPqu0r
	XS4p+IvkVl0Z4WU4wfwWLCRVuPBB7OozjjZWdBiA395nzamtT8U/Rif9CBbaHimS
	sa0ssJbDNGJAarXq7VRCmhZir/cZjjovcgdSCxdVXdtKo7Gr2QmDKrtuQkgBQ029
	V/iDVIIRX/mljzRZiabsaBfi0JLg7hNKweUVsSFRthyKwjaQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd47c6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 17:47:05 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99e13604fb3so2957731241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795542424; x=1796147224; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I4c7gySEPALfuGRpMlxKe2GMzkyCSxx7Y7o/mw/q1AY=;
        b=fgqgnHE5+1GmwJhvySCsZcoAPFdR6HkQx7tglleEgiPJKvxx1cgPKvLyblnSpEa1Ls
         Rv2et/ALrVY3U1JORgN291XCIGvuhcsneaLC08m6QFZyk+IDtFFVv552FzaVWLCYAzGV
         wjhwnGh6yaf2ZBdr4JS2BvtVfssSYjMUOgYcxHVz3AE1LK/0/gQkDdqZqJMFAq320c//
         lUWgbdDN3/jvZQUv2I1lvm56w/1w7RjXCu9IZwT9iyLKBuMGetIt48p71Xtc2w2LNLAU
         6EZGeclyW7BfCjSWgi0HnBGn6UzF2Mb5SxKBf/5f8OC4fIcNpB1qNQgkZmi2oWfjTx+0
         izzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542424; x=1796147224;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I4c7gySEPALfuGRpMlxKe2GMzkyCSxx7Y7o/mw/q1AY=;
        b=oixYCiDtXLjKwUqqDDtK6N2lRyA8zEEyM03ZkhKTmwOgGUfGO/7tpOuu6XolUCJfio
         CRPOGjSLXOLxKRZiv3Emcv6ivqpJ1blKccM954GrYXWbyjVbQ7leKUzF6F5NXSOE7aFj
         HjY7yC9hk/cp5XDianj0JtQyDqKk+mjaaT0WAH8nUboIc87huBPtbVywLdGkNWVpvH4k
         AxMTtAe1H+tU2Of/aKkwKsDd6790sfD605tNkCCxVn8s6a5xk/JyY8PR6n7zOm1hxn9C
         WhbDauddW8WJEt3M+a1CMnWA+0mK8SXWY60yPKnYitmqS3WKwvIuA1ntIxO78PxkMfLf
         av9g==
X-Gm-Message-State: APuU4Z+6943PGfi2aQEGQc6Qvg0v8n3Ay3ZHnGfRGHKm8IvgPlkhNDzr
	TZgRUMdERbTKx6vpC4KnYnfdJtq6Vle00+s64CjexKqU5VBrzmszt7t5rJjviH+KpYnpg+WbWnS
	3B7LoI/zOJx41UXqxyyaONq0xVPsvSTChqhtbmBEc/JKcrGOg/bc+2nWdm3Zb1J79So28
X-Gm-Gg: AZFdTZcWWxohY3fqqmVFe8aMd/ey+heW9C6YSqXa80uV5fuu/Qk4MqiNR+OwjHf5q1s
	SNIeL+JjhWM6iihhkfJFto/CX5Ax2aps/aeRdR6OjQs3N8n5wTSpsFFF+wNNs5DT7G7VKb7LE5m
	yg9wO6GGdzVKAmgiYclv7Cz4sjGHwNsiLROEvHIDEDngtbAoj5RkJ1oCtREUjnLMmTPNEXzOjoS
	jdD5lXIjjAi/Gu//jkGBcePwZ/dNBhGBuqY/Nfunr5ZhoMzTAwRfS1pNn8TSqmGr3BcCQD9XYlN
	WUHWrujYkf2SjW2ZaHPgyHJaLze7K3u4+UXIrdWVrUbSxqaxYmfOUN97DbjTi/sfF/2EydArvSf
	AFejM1Da5Gc2KgMrhcuc4jyxp3jCCblii+c2/ob7nYEJPI53s4Ac41qf0QR1hBRp4HvRl/ZRfwE
	U+oCMCJ7k1VegI
X-Received: by 2002:a05:6122:3c52:b0:5ce:b65d:22c4 with SMTP id 71dfb90a1353d-5ee8af0e039mr8712112e0c.16.1795542424280;
        Tue, 24 Nov 2026 09:47:04 -0800 (PST)
X-Received: by 2002:a05:6122:3c52:b0:5ce:b65d:22c4 with SMTP id 71dfb90a1353d-5ee8af0e039mr8712063e0c.16.1795542423710;
        Tue, 24 Nov 2026 09:47:03 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm7396418a12.20.2026.11.24.09.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:47:02 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Subject: [PATCH v3 0/2] usb: misc: qcom_eud: add the QCM2290 Embedded USB
 Debugger
Date: Tue, 24 Nov 2026 18:46:49 +0100
Message-Id: <20261124-qcm2290-eud-v3-0-4f31aef8c1c3@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23MQQqDMBCF4atI1o1kJmq0q96jdKFxrIFqalJDi
 3j3RlctuBn4B963ME/OkGfnZGGOgvHGjjHkKWG6r8c7cdPGZiiwAICMT3pArASnueUlEIhO1iX
 lHYuLp6POvHfteovdG/+y7rPjAbbvsROAC94UkKumBCWVuljv02muH9oOQxoP27iAPwTKfwIjU
 TWdziS2ROKIWNf1C9DFLxvwAAAA
X-Change-ID: 20261114-qcm2290-eud-81e10f3a8e5f
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b05cd99 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=b45o4kL6AAAA:8 a=dAV_Tri6AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ibbWKvYsyCdnmY7Y1RYA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
 a=dhdsR-PFWuPJUldTnwXm:22 a=jmfqb_Px-22hg6zlGo4Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX7qWrVbSzwFoy
 hoN6Ymbi3IbFSAsBfWbyr/dF1MBafbMmm+ikmnvtesCsNFVCzixlSeik809S/dIo8LC6Hvy48Od
 sHvNlETWsYa2yeiyZ41hZ0ag8GxkdN8uaDRu3UOb0+bRCPcr+kRryCsv/q4Zd89+XOAHv4pNiHJ
 wrXtRMkvkiS9QBzpQaoyQFIfxUets2iQ5CgI3iMpbi7HxEE7/e0Lcy5vqvY6xtTVB585dgYHrQl
 IvAM5Gxhkx3bofInuQ3uHXt4vmtWbV73ffXPuMQSwpIAB2Y0pAHnosku2kcDQWEcWrayKWRHup7
 Xzozbjp3dTh069IzZRxtcR/ctmLDrNxEiM555rsZbU8NiqeqJVqhjfoET+qSI5c7wQCPuVSgmSs
 XtOKjF7AALIwS/VOIaHRsXUPaCDDtPzky7DfbXAyLc/VXlzhMGU/w75ZeyXHlEeKTapZh6qYjny
 ChhZxto/gRYYiKXwkhg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX/vnkSahp/dFr
 v3qQCUIe1pDXeYgdRjRuqWKEl7HU+M0JYdOA7RvQsdfZ+DamE227CweaREbn7vEhuJIaT3/9Kbo
 YbPbn2lfgtwUVntL1zofP5H+Vp5QjvI=
X-Proofpoint-ORIG-GUID: 0pHb5yX7tUKltZS72S-8r0HVfuTCr8Op
X-Proofpoint-GUID: 0pHb5yX7tUKltZS72S-8r0HVfuTCr8Op
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240069

The Embedded USB Debugger of the QCM2290 is the block the SC7280 has,
with one difference: its mode manager ignores the enable (EUD_EN2)
unless the TCSR register TCSR_APSS_SPARE_REG1 is set first. XBL_SEC,
the secure part of the boot loader, does exactly that when it enables
the EUD itself.

Why Linux sets the bit and not the firmware:

- XBL_SEC runs the sequence only when the device's debug policy (an
  optional signed image that enables JTAG) asks for it. Without one,
  as on the Arduino UNO Q, the board boots with both registers clear.
- The stock TEE (QTEE) does not set the bit either. It allow-lists
  TCSR_APSS_SPARE_REG1 for the HLOS secure IO calls next to EUD_EN2,
  with the same policy (write allowed when secure boot is off or debug
  is not disabled).
- TF-A does the same on Agatti [1][2]: TCSR_APSS_SPARE_REG1 is open to
  the normal world in all builds, EUD_EN2 in debug builds only.

So with either TEE only the driver can complete the sequence, while the
secure firmware keeps deciding whether the EUD may be enabled at all.
Where EUD_EN2 is refused, enabling fails with -EINVAL as before.

Arduino UNO Q (QRB2210) was used for testing, next-20261112 plus the board
support it needs and this series. The registers were read back through
qcom_scm_io_readl() with a debug patch.

TF-A built to allow EUD_EN2, three enable/disable cycles:

                 write   "enable"   TCSR   EUD_EN2      host enumerates
  enable         ok      1          1      0x01010101   05c6:9500, 05c6:9501
  disable        ok      0          0      0            nothing

TF-A release build, which refuses EUD_EN2:

                                    write     "enable"   TCSR afterwards
  enable, clear skipped (as in v1)    -EINVAL   0          1
  enable, this series                 -EINVAL   0          0

Stock QTEE + Gunyah (secure boot off), two fresh boots, two
enable/disable cycles each:

                 write   "enable"   host enumerates
  enable         ok      1          05c6:9500, 05c6:9501
  disable        ok      0          nothing

With v1 only the first enable per boot attached there; now every one
does.

OpenOCD master with its EUD adapter plus the SWD fixes in [3], TF-A
built to allow EUD_EN2: attaches over SWD (DPIDR 0x5ba02477), halts and
resumes cpu0. Without [3] the EUD's SWD function returns USB errors on
my host, with the kernel that worked in October as well, so this is not
related to the series.

Not tested: RB1.

W=1 and checkpatch are clean.

The binding (2/5 of v2) and the DTS patches (4/5 and 5/5) are now a
separate series, "arm64: dts: qcom: QCM2290: add the Embedded USB
Debugger", so that each series stays within one subsystem. It documents
the "qcom,tcsr-reg" property that patch 2 reads.

Elson Serrao's pending EUD rework touches the same binding and driver;
this series does not depend on it, whichever lands second needs a small
rebase.

[1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55733
[2] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55964
[3] https://review.openocd.org/q/topic:eud-swd-fixes

---
Changes in v3:
- Split by subsystem (Krzysztof): the binding and the DTS patches are
  now a separate series; this one keeps the two USB driver patches,
  both unchanged.
- Collected Reviewed-by from Mukesh (patch 1). Krzysztof's Reviewed-by
  on the binding moved with it to the other series. No patch changed,
  so no tags were dropped.
- Link to v2: https://lore.kernel.org/r/20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com

Changes in v2, all from the Sashiko review of v1:
- Binding, driver, dtsi: the TCSR register is no longer a third reg
  entry of the EUD node. It is a "qcom,tcsr-reg" phandle + offset to
  the TCSR syscon, which already covers it.
- Driver: clear the TCSR register again when EUD_EN2 is refused; it
  stayed set before.
- New patch 1: clear the enabled state on disable (existing bug).
- Link to v1: https://lore.kernel.org/r/20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com

---
Igor Opaniuk (2):
      usb: misc: qcom_eud: clear the enabled state on disable
      usb: misc: qcom_eud: set the TCSR check register before enabling on QCM2290

 drivers/usb/misc/qcom_eud.c | 57 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261114-qcm2290-eud-81e10f3a8e5f

Best regards,
-- 
Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

