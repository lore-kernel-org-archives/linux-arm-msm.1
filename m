Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794902775;
	b=i69Z185+QyLToxrY/kBPGZheymW7SoqUlGptaCaGovcA9LMnFbgWuzztssQkjfRUXc3H
	 I+KH4Q5T884nX15hAgAFygh05CS/5gWqA7EqmJYDUM7nkUu4xqj47zjg32cnTM7eU4kJY
	 Hct4hQwcTc2+ju6RykToijq2C2SRXsK0HI+rxjRI72MFZ2T0yOz9Vl0YoBKv+fLC2AFwF
	 fONsVnTcNlBsUpKvGjc32mRVvgfujlhSNOXx6gMF5As6usoP5wPRfAyrDf3JlmhNG3b3n
	 i8nTlm3/5msLBhvpezYwfE1P4/MDCPvUEhuRqtOiunIRSBOpRETsFxmipQqlHOU2meQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902775;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mVcOkG+Qth7GKhJ8Mk0hUwlGyNCJIJbF2gvOpjE4GUg=;
	b=S1pWDiAoCIdP4SID+mOISS/qrRPbkQgTpR0ORJHhr8MRHf3qYlwhSfgD74T8NI5gpuZB
	 FJiORdviLEq06+GkUi1dLvS38ax6gS5ycRtMR9juY5vGEdjel+BYRjulzZQS8V/QEX0wR
	 7yb8bWEEyTIKbyxh5MWS6MLNl5vV8dh6CVPrDD1fYXOy1ZWhQSznmefpB9gdyO4uO0sRx
	 26G6AhRXV/CmlZguTsT56kVH5h/7HEQW1PTWIsyw6MnnsHbudRlEYkZeRJGLJAaQatT1a
	 hEbWaOLgczYE97ywXtftzS8ujAZzFUjQHln//wCKZZNu6HUEQko6zEgmlrCe69lTC4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oEMJRfOb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WlxBCLdY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F92606A323
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30F92606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oEMJRfOb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WlxBCLdY
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6Lrp13980793
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mVcOkG+Qth7GKhJ8Mk0hUw
	lGyNCJIJbF2gvOpjE4GUg=; b=oEMJRfObhBzFn5m7B8CgyoEUV2Ym40fnfo83Kb
	Z+4MWbiicroFDuzvdQ5k1BoM2U5IV9FpRhr0v0QICDzdHFh3SkHkMP+zoA3Dwf47
	jVkk6VOUdP+QBa4CqIlVOoNHdZ2VxX9r6MGw+/BdII9uBtTmzzU0OsFkr3SZUIsi
	agyZ8lABLgy33Ah5Rrk47bEzzD4lkFfdqOfj0M02vzp4tgHVPljh+Dh4qiUtv2jR
	CbTNw+PCsqnJl0IMGvealZaSz0s+IyiuL2j0dtxe3NFPaavDwy7/bqXlnNMNEnJG
	1RXUuXVhMWM8529RbWI1QLwceFPZPZij3PoD5IkAy2ppKS5A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd0cdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:06:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3a9826f6dso779248a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 00:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794902772; x=1795507572; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mVcOkG+Qth7GKhJ8Mk0hUwlGyNCJIJbF2gvOpjE4GUg=;
        b=WlxBCLdYpMJj6XpfXHbjeESup12LRA2XCBNs/551jmKsaHd7gNKHaYEAOR9Jdxc7ok
         hKIov0MQEzMxPSO8v0fOvYrX68JNNFuwLlPGTyE9m/CI6MhOl26Xq4V9NY6U+CQrGQmE
         7XJxhAYQp6s8ZDBEczCwyDN9pmL3fx3OAAFLJAq5FwdZVXRhFZyxVpAHx/KCF/zjhKzD
         23WZNiKpm6uaJoiijA5yWZoq3acqitdaR3Z4HGUSxrg/MgJ8+XgHBXnLz7NN9bJ9v2rB
         AMlsqpPF4a43sqMcPn8AbxvCRB+K2vFNU2tu8Qr5kPGskxkGAQ0BpCqXyuLX52lqEjFR
         j4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794902772; x=1795507572;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mVcOkG+Qth7GKhJ8Mk0hUwlGyNCJIJbF2gvOpjE4GUg=;
        b=LtaxhPBXtFz+/wG9gDqBqT78RTVCbjslHoUOkL1wRwlYCEjrAZ8N1gtjSYqFj1r6va
         88Qig8jtTTrQ/QYs/TaR4teiNpEiKNGo8vbmkK1wX3fO8/t4HbVFyD6UdXSmjYzhCPTc
         Hf3MFnF4Bkh4rtNUoqG5ZdTml0nreLpNL1XMKtL7liUvGMWO4DvkmZT45NKR9ibU8iW5
         NvdwLBKFAz40GFvLZNwjJjGQkIndhSYihJvlLoVq7yOvbaoq9UQmFDHnRhZvmn6OR2Ii
         JkADWUZ2RLxmebs9xPeNKOy2KAE3uaF+ufzJABs0QLhgFQ5eKTmLG/TrulXBnzT9SS0F
         O7iA==
X-Forwarded-Encrypted: i=1; AL+hErGQgGlzRP7d8YtzAYBVu9psqmG/HVm5cpLrQzTVJLVP1uGuG0buvZQ80O8HXKGchjsp20a+zYTp6ZjNbrDZ@vger.kernel.org
X-Gm-Message-State: APuU4Z8Bgoing/DE9ERY5PXmW35ds5nrzV6Fg9YCswG+c5yqCPyUx2RV
	X5E5xUIPW2zYWfNhwrK5iltVD5I7vi4uPqK45avf60twkibq72PgEZQlvF7UJePqivddtMZXq+s
	EQpcVFtP9pc20/Q9slzZ0FiJ1Y7sabtTZyx/mBJTF3QPOQn/5FKp4pTzReFy9cy3Db1Ileb5jyR
	Eu
X-Gm-Gg: AZFdTZfE08qsPaQZipPVLQg//TX35fNAnP2e44j/STkBEjqD5dbQps/WlRy/305XVuQ
	ywK1mS8ENxc35k4+ydnlZLrPstVUa8n/CUelAOIrgTl86O5Qd4wbb9XEwPe/es/plQveQjAasKw
	T7250UdMNhKKBTSa17WbcIRXsaCYm7GmpBWCSD36mckskKBNlNWCdPPK4S15ZpqEEhMV+cBcMYg
	/PQoYgg1qn/kkWIUWPT34vFYB9JPoTlcH9P21s4f8PpKeX76ALY8wKhdkjkxzD9NoChWe7ACPEd
	KdXeK9Rj5CM9eR1vlZhMbNfcxFrIawoNfnIIIHkUcsNDlQpmsgDc0+Jkzdft4o7yVCw6y/9Fq+7
	mz7Dg1z2zRuZua/3KQITr7zea2Xfg/OHiRdo9bjedUSmPWLE6ELRN/CUtvwdpwfccY7CRScjHCX
	ngmjqWWtjGtg==
X-Received: by 2002:a17:90b:570d:b0:3b0:d070:3c4b with SMTP id 98e67ed59e1d1-3b1b0a20ad3mr10000452a91.33.1794902771843;
        Tue, 17 Nov 2026 00:06:11 -0800 (PST)
X-Received: by 2002:a17:90b:570d:b0:3b0:d070:3c4b with SMTP id 98e67ed59e1d1-3b1b0a20ad3mr10000429a91.33.1794902771289;
        Tue, 17 Nov 2026 00:06:11 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abebf1aesm3031852a91.16.2026.11.17.00.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:06:10 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 13:35:50 +0530
Subject: [PATCH] arm64: dts: qcom: shikra: Mark RPM message RAM as
 no-memory-wc
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
Message-Id: <20261117-rpm-memory-non-wc-v1-1-e246fc6bc66c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN0K/GoC/x3MTQqAIBBA4avErBtIjaKuEi3CxpqFGiP0Q3j3p
 OW3eO+FRMKUYKxeEDo5cQwFqq7A7kvYCHktBt3oTinVoxwePfkoD4YY8LJoB7N0zhlqjYbSHUK
 O7/85zTl/qYx0uWMAAAA=
X-Change-ID: 20261117-rpm-memory-non-wc-c93a6ff3e432
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bibek.patro@oss.qualcomm.com,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794902765; l=1582;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=oPm/ybBtfQ0EkhLd6zSb0mHDUs8lvynG+BDZgwNHoSo=;
 b=L6gmiS0TTAbcTtsRWb406F5mGFzc6uGyeUsPkD5sNmr4Yg8lHFIib0zAyzEUEOWEl1bQWu43H
 5ZvxEQEit2EAyDaU0a+RUpMnFFAFt1qbJal7PLpQhdyihv1C9W4NFVY
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afc0af4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mNKF3LC1gVCpUj1y5nwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfX7/woMfFJI8EV
 AQbK0MqCwLgBT04LlUwRwcA9EYl4DoT0s+2BY/tJFJBOaas8lQl1BrBEi7JACiCYQ5e0lqxUqUe
 8l6LFJ9ZOBdGwe8YHWyEeHyKezPV9Z4=
X-Proofpoint-GUID: EeVcAXm4e3RG002Yx7c7b3LGy952oWkf
X-Proofpoint-ORIG-GUID: EeVcAXm4e3RG002Yx7c7b3LGy952oWkf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfX7iywMp2Pv9aD
 YusQGnf5PCdVujaFpxRcjMgTrn+BLhH4DALgSlOFh2dXO5QYFButBp/1MqO0QBUg2/FwuOUEop4
 ZNJk1AX8TXH4qwDFKV85BzvSucXvVxukDx3Re79e4msE3on1Dobh7Ux6L+3fd+tycjU4NassWgH
 Z4n8yS68uJFhPr5qSDA1dCppxAn6q5HcAh9LNmpnUGZ5e2is4tpFUAqbQzoFSxZh6i+tX/QolhP
 ueIqXB5BdQirEqlGza70f+7A/xnIfcZ1AQv/uTjhZ2uSgBPPKeuP6Yoodi07LhhVwkN83BcgTwg
 YC+PnYLVJXw8+s5iRcAU0MqoWW3Y6EBJKkTlW5gyj8oXXqWRFesdJoNiEGByot2VD4Xg2VlLutw
 UVIVUqCMnyaCRbc2lmcLAV0eZza0u0brVaEPUEDrR5tF0npGJ3DbuHrLpzxui3vrjEPJGa5q6rm
 OxMZSI0Lg/S5Gbl8oPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170032

The RPM message RAM is shared with other subsystems, and parts of it
are not accessible to the APSS. It is expected to be mapped as Device
memory.

The "mmio-sram" compatible makes the SRAM driver map the region as
write-combined (Normal Non-cacheable) memory instead, which allows
speculative reads into the protected parts and results in XPU
violations.

Add no-memory-wc so the region is mapped as Device memory.

Fixes: 66664b5701da ("arm64: dts: qcom: Introduce Shikra SoC base dtsi")
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
A similar issue was fixed for the Tegra SYSRAM in commit 61192a9d8a63
("arm64: tegra: Mark BPMP channels as no-memory-wc"):
https://lore.kernel.org/all/20220622132300.1746201-2-cyndis@kapsi.fi/
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2623e139196f6398c57b616879a37f84b83d59ac..597aaf490519e605d50e24c090bbfb1e47b1f28c 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1347,6 +1347,8 @@ rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram", "mmio-sram";
 			reg = <0x0 0x045f0000 0x0 0x7000>;
 
+			no-memory-wc;
+
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x0 0x045f0000 0x7000>;

---
base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
change-id: 20261117-rpm-memory-non-wc-c93a6ff3e432

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

