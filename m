Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827011;
	b=NKD5ZgwjwE/l1FIrnLuVfQhbcMo65cDIOuGIGTeNADCLOJ8197n/OBYi8ijLcRce4W2M
	 X1ARBlMwMHBzLzWOPqacxCrlKA+MSv4bstIMCBkDyGxawzmE8nqhJY4IdJmqxc1g/ld5C
	 vwD1dAAFTdEUuIlGFcF8ZEKc+S7LSTXxHKhAf1MCczpxaHsg/4y273kJZutk+oPpMUZjh
	 kfhzzQmJRHOY/LzBIlB/lOxIJwxqHRHVxVAFhHv+CKZnyOus6S4U3NFfanGtdwEttEG03
	 E+cjrryVsVElezCHPrrL+siHyttyJlK3yYfkUhyy9ilDWxwrhFwpeYSTC24CDQgKDWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827011;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1ng8Ocvz7fCDJlR+ot4zgtaeJUok4UFUIh130ek/3jE=;
	b=ZVXVVv5Vh1je/IegwGffVu962C26VykpXG/jZhLsdtc9Jp3/m0RHL9y2/TpCxl2Tvpa/
	 KWuJzxOn68eVyf4PQe4xyICy5LZkX+VOfjQOunkavup1qH422aSYwc+5qLZDvzel9saVh
	 E4XMa5FtzzbF+2aYWGknmintX25KbCcRpYUPkjwr7p07z4JoNlOPpDlORKDSUAOhvifNH
	 gVjW7vnqxElSzs+AnnlnfMLzp/buqHdlRfDlIfjsd4EJVZF6cozu+epaLBfPbLWChstEm
	 yoa9gTK6OiQwqGO+M5W3w0fAddv7SVY9bpyXjwDFLR5WuqE3YAXk5G4fIGb0mUK56lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g8UMAqiD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WYGqMBa0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0541E606A330
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0541E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g8UMAqiD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WYGqMBa0
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7ewqE3488779
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1ng8Ocvz7fCDJlR+ot4zgt
	aeJUok4UFUIh130ek/3jE=; b=g8UMAqiDvzWqaJx+jr9HP3VmQrajYOcDXvunfs
	KQ+ho6F+A9hm2V8ey1jBA6nFNSld+eJGyv4NRKt/GZoZ7Ez6EYt8r3R2WVbUihZs
	xcCPv7V9KSqRu3gtCBYmI/sIBi+NbsrG4xc2Z+4kTXqhnwGT8DxwVuJgQKRiOPbI
	JPLMKef6fj3k7KIa1jerUQ6sAteybHHuJzhImIKPQ7j7EbheBGOqW5JrV3OVd71C
	lMaaOomiZk6x0E3ZyFrE0aiC66q7xRbCRQwTRpZKhgATNd0u8Qo3k7c6TADzsya8
	VT3Y+0qr/18Rydy9BF5y0eAk4vNfB+lcfaX9jLQzyBrAnZTg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmce2kw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:03:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b7cc3f8a4aso2064864b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 03:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794827008; x=1795431808; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1ng8Ocvz7fCDJlR+ot4zgtaeJUok4UFUIh130ek/3jE=;
        b=WYGqMBa07TldRM1uVVNJh/WuGNYpnZ2AKIamy6p6aVt05UbGyb906tbRUFhQLWka0L
         rHfWCw0ftNUH59/Lu+dQEJKY9v+0VrHKeuXSpemaeEgRqYju8wVLI1yK7P6GZRBNXt+B
         tvCk/pITpQNCLw0YXij7ihv7FiVG1hFJ2CDOdooAKxlMrwtkNNRFYnCRE/T/BqMIDydy
         /ej2ohnHXyEanE0qW9/Vev82s4TFsOMKmHo+UD0IRJnVKyUvAcS5j/2Bto8vdFdgZi4e
         xoOJpASAzqN6b6eZUS0wXN0Yws8MK5QArwV44sCNdFFlULwNu7VWnDn+fJrWC7z/Cu9e
         iBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827008; x=1795431808;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1ng8Ocvz7fCDJlR+ot4zgtaeJUok4UFUIh130ek/3jE=;
        b=EAJ50UEuvlqhnZP23m/WoCOWUjg9KrwDUGGzzUpNdisABYOwUzXFMUXOpgnZ3LapK1
         tbmGcEj7O42uMIO9O0JnvHY2TmmXeD58BQlombm6IFlu4Y9/0WCvYYJT4rAoxgmONm1/
         yGM6NJzv33bLmrAJukncZezRhPzhshIYlEWpWMZ+0Qa+ATNQ7LpA3s7SHgSwDAocb2tJ
         UIZuC1WxMhZrO5Cq60I5N8ba0DQ/l+9a8Bu+d+ZT3Wp5yLuMMM5RdHqxYRZZ/s8/No4Z
         eOB/Aq8RPoTJKvkxspfuIK5Jicf76ZB2u4VBDsKKEbfWO381mXFdX5dQKy9MuUEc1u6U
         l5yg==
X-Forwarded-Encrypted: i=1; AL+hErG6WvhA5Aot+fkYfervpssyd7c+IlzDr2FZc5RCgOBrxxY+ojfT2ajdzHMPGY42j1PH47xHOU+ucxTo+DBu@vger.kernel.org
X-Gm-Message-State: APuU4Z8G0Z0rqme+t33i0ulasXkFdW7csmazfkDcmMzxwLtMR1O0ehgr
	Q5ZxJl9zVw19RqDHY66uLekKumUVeD9ovCxgLbgrpLbj5qfBjgcu4r3RJK7cvL/OAhPQsrDfEqF
	G/hMx4Cg1r6lqISA0IzN7W6+hqC0lPokr5sFZRuYT8ZyUtjKe0PpW63XsTIsHcur8nchc
X-Gm-Gg: AYBFou0hauzxlFkUrBroB/bEcQ3eiaqaWBihkYQ7p0pC2wGNoI6GdoA8t75E/1CFBUC
	+BxUxZbJfNqK+VP0EWCRaBczInFMJOzCDbnhN5oZAkfNX+qT4ZPEvs+zK+K+ec6KhGwUB3uy1VC
	PBn736P/i2ZK8MQM8osp3nf3D6iyLim4ihaCzqnAAJYtexcaXuZ9WDLLES2kXLiF4gZ+qV9Dvqj
	ecXaZwGLc5sW5pPetnwMJoNyhrZ3hAVk0ZTPm5DDP/eQlzm6Ld+s8qzHTiF1MdEezdqqBhP3DLt
	x2Sg6hkVZCO0x6wfcsx2GMiOg/9+oCKrGaL1KeYN1iJZDJgB7qyLlEXCTd2Ywn3jxhO5Qzl6/5g
	1wKGYIwBEFEGTl8MubFoH06aZHbQR/6KPMBFk8xU6Fff/Ae9OAs1sFsg/AhI3X6Ifekbb2DrXHw
	3bcyqxoDrbbgsNoBp4Fp+VDaH0uJ89nvyMnmc=
X-Received: by 2002:a05:6a00:1995:b0:8b6:d2f:72ae with SMTP id d2e1a72fcca58-8beb53d9ea2mr10042025b3a.18.1794827008517;
        Mon, 16 Nov 2026 03:03:28 -0800 (PST)
X-Received: by 2002:a05:6a00:1995:b0:8b6:d2f:72ae with SMTP id d2e1a72fcca58-8beb53d9ea2mr10041988b3a.18.1794827008017;
        Mon, 16 Nov 2026 03:03:28 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8121sm3499779b3a.20.2026.11.16.03.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:03:27 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 19:03:01 +0800
Subject: [PATCH] arm64: dts: qcom: shikra: Mark cti_riscv device as failed
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
Message-Id: <20261116-disable_riscv_cti_for_shikra-v1-1-d7cc81f901e0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOXi+moC/x3MQQqDMBAF0KvIrBtoRK3tVYqEMRn1Y9EyI1IQ7
 97g8m3eQSYKMXoVB6nsMKxLhr8VFCdeRnFI2VTey8Z737gE4/4jQWFxD3FDGFYNNmFWdvWj4ti
 2zzoJUy6+KgN+V//uzvMPM4fa9m4AAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794827003; l=997;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=odo/rV5qNFliIRkRRmj1dui5NiNAsjMnmpo8SoR/RjQ=;
 b=jknWsnBgy2n9uBICUy4HdpeRPU1LJHz5YpX8UZFlu17CDjHJA2PIRahJc+OKyVYSSiUj8Auce
 386loIbS9/fAuK6x48tCWT21m5rC5Wn4c8VOUfzCuS7dw/jkvAbjkMV
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0MyBTYWx0ZWRfX6zd2YMNFvhb5
 /s1Mw0wQlZOvnOCUax0VNBe7BcCM8wXOrrDlgptFbq4O2Z1RyUy7QyjZEcJt5qrCnRvvikxBTko
 AQwGaCACC8NUO5MXJSPxRWWNROUTdDQ=
X-Proofpoint-ORIG-GUID: Y1V-qv8oNUKPyQWnYFD61DuHHb_fxSUu
X-Proofpoint-GUID: Y1V-qv8oNUKPyQWnYFD61DuHHb_fxSUu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0MyBTYWx0ZWRfX5eq9kVT7psFK
 iBxPbMdC12jKOuscc1PiiX0Cd0ZjB2ZtJ6ycfbqSPVzu4VmoxqD+2DeKpMqzmwyi3cSJYILJnJP
 mdlx1kVDCaXwoN4GQcqZ9odDPDS8FcVUeXQARcegl9Lc7ME6L40anmNZA4v93LxVm8SPOAjUkPV
 oJcM0/o1dTNhKYuR48mf07uwbAuJrtiiu4bRc/F3YYBhyX+5XpoR6pnaGmDDyXD0roxDPPWewPI
 Cl8ur0f1p9lxm3iumjY4ICl6WTavVHpGs7qlh76cyIXPyTBSFizgd73YQPL22C93pluw59skKWA
 3cqJFn5I1OhiBfTWr7U0/bjX23XN+V11sq72oIKb5ep1FOuxBdPl8A9FXH2g3yaPnxST+gZw3XS
 5iEH9n36v7SXObpdH5GZevuAihLTsfbOdtf/WZQYyWCdYzT+OuUYDiaQphuCe0dS0feBJSOczKV
 Gv6MP35lUQEl45dMNNQ==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afae301 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=r7GndIfPiZ8jbtywizEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160043

The cti_riscv device is suspected to have a clock vote issue on the
KVM enabled path, which causes the device to crash during bootup. Mark
the node with status = "fail" for now to avoid the crash.

Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582..5f5a786fbd2c 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -3996,6 +3996,7 @@ cti@982b000 {
 			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
 			clock-names = "apb_pclk";
 			label = "cti_riscv";
+			status = "fail";
 		};
 
 		tpdm@9860000 {

---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261116-disable_riscv_cti_for_shikra-574ac8895dea

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

