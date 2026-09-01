Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F85042AFAC
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 08:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250050; cv=none; b=VMpK15Shhmq63ktGULd2Dtvv5yfwqMHlJI2ztadzu9mHCxUtbumyhDQ6wwkMzZbeRYYrULirVgLJJWEps2OrHdbZQuduCQEgOqOTHPG6ciWlR8auYEpYR76Uu+URpJA+00+Gr2B39SW2V2Wqo0Fkr/svfLVkNnCL891shSkpHFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250050; c=relaxed/simple;
	bh=b+2ardxveMsnWj4o/RsEP2VSYMiRa2YAjaOSkYsrcMg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YfEM1uqmsHnP3GPRmiH8OImYLZFVQ6MmHSYoXMRN6/nmKrEAfEhKWRNsTeCGqt3LAsBUTaOA480Mb1Axf/rYa8uTG4jicekVo4h4+rGfs//cWmjwbfGsfLoOy1jpHXMbZjqhcLm52GkhMg9xSyMRbP/+lcF+FxJNCghTTgQcqqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DzJZGrb3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LlcPNT1r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DzJZGrb3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LlcPNT1r"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68178n182973805
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 08:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m70Zod04ICRCdjzQSFGP1J
	7d7ucr2LQUKCZ1g0ilD+U=; b=DzJZGrb33eIwe2dDdOuGA5hYdMazXCJiyckwZI
	Bj+SOZQ4agDkVNg7gn4RwKigmJoofDfbIvVCyXPt9qrMcEMeQCh0R8EUgr4OCjaO
	C0F56IKJTLgs/fBwGe2mZJXuu35t8z101Wgx0Hil6mr0r9XLEn2cc1xo92BNf8eQ
	VRoXhKq4Un5yEFVL7awvlOpSxx4Z4P+l4YwZdFFCWjhIRzMlvnhODKgUK04et+1X
	Ka7abotxhDL6FjLsUFHk/j9b2Ziam5vDYYejmzJg+PKR5IyibrJ7MGojIN7jYhjS
	3KpaZ0fWyNOzU+PIErYbpS2t6VoZrbkFdydSjK7BIkDO3S9g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu0bnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 08:07:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so128248485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 01:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250047; x=1788854847; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m70Zod04ICRCdjzQSFGP1J7d7ucr2LQUKCZ1g0ilD+U=;
        b=LlcPNT1rtnBWi4qdZuLisceqsgWroJA76cIelnejTfqQnhgETSpxnCIrqg9s3CXxbF
         lgWE59JG8NbsGORZ4cX4SJ1vtjIKBrgQXN0JPJGJsn9ZGf6ahiJKKZyx4wQ4mrtSUO9i
         VP+461QzlOZzl6sifL49DbTnTi/vgKIWMzEXNariHx/tU3DN3LTQLXMZ1BaFzaNubB36
         i+nClHsOEBmOOBVU/b92HWooeS3gU8nVq+P3vglNujaQzwczKQt5vzLEMzUShk0DCqeq
         iefMG/Mk5CyadG0H6nTRDKTbKwDn8gYOsMDFNHmKC2Pw9DO/mEnKStTDTX9TH2PIIgH9
         y2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250047; x=1788854847;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m70Zod04ICRCdjzQSFGP1J7d7ucr2LQUKCZ1g0ilD+U=;
        b=qW+uNf6acOZynoyax2C8T5/4UQSZzTMk7rBPa1TK1w0GZYPF1wX33jNNjHOKilJIJT
         qjJR3RIqsUDUlBtAKF+HA6Ns/pc35JxAcneVNDt80RZmI16AFpobscCRjbOA9q6cP3mS
         BX8fpq9xuFg8l9YqXLfBNfERQxy7kOCRW4M2pwTaG1LGVoyKI1NKO9jds/R7O7+/oheS
         1KbfWjqYGx+E+HBNdxd0n2AcQd6rJeeS+0mXPeG/lFG03QC3vxHUWltS2cAqCPy7qL+L
         dlzbEn99Z55jgKdTpyLDOixDMXFEGXt53SyhWPRe7UEOpZt1CKCwFtJ5dpRMHnA/IdUW
         tjtQ==
X-Gm-Message-State: AFuF++m0JlGLMKBLAiB8OgNoohF56XT/4U6dzCYN253ErSXKgaacph+C
	Ta6w0d6m4CjfSJN52jgcz1vEL1IZqpfTidH8ivQA7yqTuQOHjLU+xRcHE3zJu7Qb/ljm1fl/vNq
	+b9UqpAmmMxhZjLNxv45IVBmS/zNvJ3U/cdDCkVLTVozC4U4hr00RAWFN1joUP3BhlEfc
X-Gm-Gg: AR+sD10i8Rpxiyb1tOPUwZTTh+f7sF9XOuOWkOQTxrIbhhBnewAaKBv2g9QIvawEh08
	4+Uyoqzk9w7aDQCYWHMA59TUZZLF9Y9VQuvnN1hK1kiKVEyKTnF4YeUOJZWmt5XMEev2V173I1g
	3lw0WASxKO8I33u96r3OoDQLj1Cqz6SKRPFekIXUTNnlPLo8SF5x8ogD/nqNCEwHH572jerkMkM
	1vCCSw2DLXLgc4UW7QkmASMAhFhZjJ9tgE22BwdaSecXacyXkxEGvBtb1v8U/BLoVN9/TnzeO5c
	FN1NTZDcuwI9lrZiZyBaL+zmROMCsKcLiWPu1Dyezgz0ObidLeHYJLqEbZM/AvQZBaWp4Np6W92
	bQt+CWhzQ
X-Received: by 2002:a05:620a:a0cc:10b0:930:a26a:fb2a with SMTP id af79cd13be357-939137af782mr2808360585a.2.1788250046753;
        Tue, 01 Sep 2026 01:07:26 -0700 (PDT)
X-Received: by 2002:a05:620a:a0cc:10b0:930:a26a:fb2a with SMTP id af79cd13be357-939137af782mr2808352185a.2.1788250046047;
        Tue, 01 Sep 2026 01:07:26 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:07:24 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 00/16] arm64: dts: qcom: hamoa: Mark the EC reset gpio
 as reserved on all boards
Date: Tue, 01 Sep 2026 11:06:57 +0300
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKKHlmoC/5WOzQ6CMBCEX4X07JJSQYgn38Nw6M8WasRCFxoN4
 d0t+AReNjvJzDezMsLgkNg1W1nA6Mj5VxLilDHdy1eH4EzSTHBx4c25ADMTTNoP0MvBSwiYABE
 B9fHO0I3OA1e2qq0yosSaJdQY0Lr3UXNvf5oW9UA97+zd0TuaffgcO2Kx+/6sjAVwqFQKGWx0X
 dqbJ8qnRT5TcsjTYe22bV9ioQbw8QAAAA==
X-Change-ID: 20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-0bf57fbd24e7
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=4476;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=b+2ardxveMsnWj4o/RsEP2VSYMiRa2YAjaOSkYsrcMg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloeqsnyCY+MdHAPbs0lmlg6ZPSmPdiqstnJG5
 gpHBAb6zkqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHqgAKCRAbX0TJAJUV
 Vo/6EACOP/dlFTht1vBupYGXd2dhyti/8+jEH5Fq/Ue8iYTZjpJdbbbmJwBnG+1yqoKZm4+/lij
 /r4Y0pJ2ote5KJku1f7k0WICKeWp1XyoQs5HPVjtwfkdcxTK2GJtJDShFMLwy+Xgv9htBqDiyvx
 prCJyXX6CDca3uCCk5M3n+M/G5aet7Wz8zH0CN2Qqp2sX/JRz/lvXYFsaA0gfWtEKBAyuCfYx3Z
 W336YFn4NP4e4KXr4cP0jVG43Y0j1c0A2ZgvOqSvl7HcmDazWaLHbNgpMUV2oB7jhIsxBLO3nn0
 6fNxv7scsAuNkrr6ezy/g1cm7V5LbEta1IYkok9kumfmnCWI9sWlYYyB8wZikGpy55ceBtgCJJp
 EJvlGOcZWvvmFJCZcvcIx6s6itvVrGioXpLV5hWBH3vlPSbzaUtr+xObK2w0L6ePJSF6rJM1qvJ
 CtsImA6OfiSmhOYEzHktaky6rddNIU20v7AAZBweSz7Z3m8+uvJAmzgG/PXr8r2cvupos9Yc7kM
 7t7FAgt8hREqb3s/IP4djAypnOehKwE9vbKSUNR51zN3dDZjRiv7RKfcHjujhPqxpKqGOCPE6eX
 ePt6S2UOTCcjeVyyn+aiXSMt2B3XyEfsE0KMbovW1QHyjTWqAmqwC6832YxDc82txooAPTuUCpa
 LvNFL3Rk6STAqpA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX5zPFQzru76p0
 BImdJnrYRcDmntVimcYMYbtTCaEdt3zoS95DyQrYiubxu33J2FexIumqOqV0qu0A3If8YAMtZp5
 mIFuESP01SlNuB9RvZTKos7757jgDD3XG8zmzym7aRe82TK/QMt8qqp+fAdB6MF2hPROMOk9I25
 AXuhupfoz+q5ZcMav8xuAriNio5B4yMH/29N21UZRhzI1FCnTPm2ZY/TeEdSQnAc2yCJm2/B7Ck
 5RzCzKDKq0lA5kCF13UcHwKCYCDZXtcFeHRV5/R5dJGVsoHH5CfOqScP6wmAWRCk0GVaJCDvbs5
 4F30lkjY9lJ7zy29WNz3kVsAPAUk90Npqoh/ZJBkPyfVgZw1CMpoqFOlIF3MGqcWVcHdgAKTdpx
 MVQ8j0LrpJFC46ehGcXv88qobwxo4+qu3pICW24dcTSmojxSLmUyiSdh6I37ymV9huPgQx3FFPK
 aXodVTiyI/wq9Crj0Ew==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a9687c0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=yDUiu3_GAAAA:8 a=iLNU1ar6AAAA:8
 a=gxl3bz0cAAAA:8 a=X9uYJ1hcyrHnrYopOo0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22 a=gafEeHOdjwYkg5oUpzAY:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfXx6o2P2+FKsyT
 R1DOmRR12YYEIzeSL6tgRXa7TbFl3Y7lSx9YVsiD04M7uu91jfoS2Qt7lWQzLQ5ipZu85t4iIDF
 rxiud0/Tn7nBf8IImG4kkxrI41wNWLE=
X-Proofpoint-ORIG-GUID: 3gia-wk45TIzmfk0ing7wuqXiMRD_Skv
X-Proofpoint-GUID: 3gia-wk45TIzmfk0ing7wuqXiMRD_Skv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010071

GPIO 65 is confirmed to be connected to the EC reset line on the CRD,
QCP, XPS 13, and T14s. The same wiring pattern appears to be shared by
the remaining Hamoa and Purwa boards, so reserve it on all of them.

This prevents Linux from toggling a line that can leave some devices
unable to power on until their battery is disconnected.

---
Changes in v2:
- Rebased on next-20260831.
- Included fixes for all remaining hamoa/purwa devices this time.
- Link to v1: https://patch.msgid.link/20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Rajendra Nayak <quic_rjendra@quicinc.com>
To: Abel Vesa <abelvesa@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: Marc Zyngier <maz@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Konstantin Shabanov <mail@etehtsea.me>
To: Srinivas Kandagatla <srini@kernel.org>
To: Ettore Chimenti <ettore.chimenti@linaro.org>
To: Georg Gottleuber <ggo@tuxedocomputers.com>
To: Xilin Wu <wuxilin123@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Val Packett <val@packett.cool>
To: Laurentiu Tudor <laurentiu.tudor1@dell.com>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
To: Dale Whinham <daleyo@gmail.com>
To: Jérôme de Bretagne <jerome.debretagne@gmail.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <quic_kdybcio@quicinc.com>

---
Abel Vesa (16):
      arm64: dts: qcom: x1-crd: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e001de-devkit: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e78100-t14s: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e80100-dell-xps13-9345: Mark the EC reset gpio as reserved
      arm64: dts: qcom: honor-magicbook-art-14: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e80100-yoga-slim7x: Mark the EC reset gpio as reserved
      arm64: dts: qcom: medion-sprchrgd-14-s1: Mark the EC reset gpio as reserved
      arm64: dts: qcom: microsoft-romulus: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e80100-qcp: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-asus-vivobook-s15: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-asus-zenbook-a14: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-dell-thena: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-hp-omnibook-x14: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-microsoft-denali: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1p42100-thinkbook-16: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1p42100-microsoft-sp12in: Mark the EC reset gpio as reserved

 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi           | 1 +
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi            | 1 +
 arch/arm64/boot/dts/qcom/x1-crd.dtsi                         | 1 +
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi                  | 1 +
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi             | 1 +
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi            | 1 +
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts                 | 3 ++-
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi  | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts        | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts | 3 ++-
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts     | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts  | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi     | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                    | 1 +
 arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts    | 1 +
 arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts       | 3 ++-
 16 files changed, 19 insertions(+), 3 deletions(-)
---
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-0bf57fbd24e7

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

