Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019032;
	b=rn/5Lj6cS39S7KbqZro0PgPakRz3Zvh5WO754wxNs/U6BIC4ZZU9arPtVz+raGXuRqzu
	 NEumtXmgOtwBAAgIQc1R7OOYbTeUZmuQ76RpGoJYEzCAvEG96tciUcQt2sD7uJMvyNhGF
	 xj3EvpURLcJnOnHVt+eBaALzFmyKqIXPDjLdfcj17CDKKQj2j1HT1XaQ9p24FmKrxRqHa
	 +Qh/wpCd5uv6o8Lo4OLxyMmscStuq00eXc7TIwDQI8d7dqlFFi6zeMPq2YW/ClxZv/W7r
	 r22m+Z/kFpzjJS3yjE6mzVNLw3olF+nNHGR/s141S/Ou3YSKrk+fvqZ9MTKNPzusjfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019032;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gja9id1+VOW1RNlfA96nCbcm7qe2Qf7QRAaccXjN1QU=;
	b=AWnAdETDL2/6TqRdQLhIRP8zrHYgnB2Mp0CEgUWBDJ44Kpihmiq2bmxjJ7wJeXUTAKgY
	 /FugSW2OB4zgDh2l81EWObQ2hODkFqLmoyx1zWqL7eMMv736snzvmL5CwydvwRVkrCP5T
	 gMQajB1X0HccI8I8KN/ZOMyQ3P4vDXsu84x6r9sLjHa3BTYFuHT37GG9+jUCnrtris1Fy
	 sFt4wz83gTnhiGFuDeb0jmBF1BazIVPprbA+Nm99q4zKroCqL5lfe6q5OVkOpneaeCswh
	 K2YXic0wZph+lx8ni2/off2pUUo9w9GNgLurKzaR3rkFarlLBTfGFJa+dPW4s7967XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UnQIASL4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KqjOXKK2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2FC606A331
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 16:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B2FC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UnQIASL4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KqjOXKK2
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQ90q3912222
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 16:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gja9id1+VOW1RNlfA96nCbcm7qe2Qf7QRAa
	ccXjN1QU=; b=UnQIASL43i2iU6Q01eD9Hmky0gd5FzKSUjCz9YoNvM/zIRd0Bmp
	8aS2V/oPSRt8TZ3IBh+gAGPz4S544Indo17t996TZvOF4hfno7u0z57RPTPGXHzN
	LNvDcb6JPMc6e99acqFrLBEUymEevIBJJRDZNTooM61u7d7WzFSJEdAiEZRwaxge
	xhl5mpiyKgw39gq9gNI30C4jfronNINTpp8UJoLg2EAWfcIDqKbi+ueHe68NGXgk
	jBiTHDlmqN2ae4cFZjP7C5ID5NKftsyysuXSVLK5kOZVnLZjVilcZvr0OARIALUC
	jqhFyHLOURq9v998o8mXJVc5nFQiKEcK8BQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9c1d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 16:23:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9493e89d4f9so198402285a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795019031; x=1795623831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gja9id1+VOW1RNlfA96nCbcm7qe2Qf7QRAaccXjN1QU=;
        b=KqjOXKK2oTxDJBol7Nlh+NKBaSyTHZ3Op0rfFmjb2rUVyVjMBBrrHKdNofS/Gm3xiR
         UbB/0E/2VOKVW/T170Tii8rP2IdahA1v938SYjf9723heP2Mo9+aqy/qHeJ4xuouxPVH
         9f+PA77z7YhnzeoT4tV7I6QvHMC4Q6JJE/Dv/vWzIBaAmXmYQkaemhddDNTNZqLrjjdB
         ra+W2wrd290auaNkfC88Ose6D27DlNLVaq8Uhnu+YBuyWZZ+E/icawvRvPd54TekK+mk
         WRDCrjmGZM1mW7A+q4kZbfh82LOLVgHvCIjAvNabRxhJWYU1/Uns0xk1xQk+gDhuQLpC
         gjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019031; x=1795623831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gja9id1+VOW1RNlfA96nCbcm7qe2Qf7QRAaccXjN1QU=;
        b=lzpDEsyhvbpDN+x/qAq7oZA/z1SPURdCkRsO+o670KL3+B0RRWOMZIaBSSV3w2SFhB
         xcBL+XmObbAOd7Q/Ggo1MXmOESPgXxJInu9oIODVm8UsdG6sFBDSmQHc6u+rlx4j/w4+
         NvX4YamwCYvlSFAuJgu42xkBc9shLRMXN6/+0x0b9FR1d2/NDFeiNONE63OOqeU9kSYR
         e5CkH/l5wU2H6RiQFztGu8AsoxCHeqjyZYdlKcCYW8K+XraMnC+QG0sFC+iglLXlofeM
         Ce9IKFkSyI8htA0eO0Af0rNIvtbXHBES0ORpMys2fg2duz01ta9PYxG3iF8XRfLSSqoH
         ykww==
X-Forwarded-Encrypted: i=1; AL+hErEKUk08zXTK9F/jukzxwIG2rqpCAY5gSyIxKANoKGK9oOZdaTkIEr4oY1/ZgFPAf27A6r0NAZ9If/mlbdyp@vger.kernel.org
X-Gm-Message-State: APuU4Z/2OCcAMn/0ONxMH6Uo79DgsPnq2Nnuy4VYJs5CecC0hFebS7HK
	RMmTg+GSWbjb/mt9j4ZJvspx1u5SsNgKKgLmBJui1OOBZiyJwoLD3NYgoZbI11AZD8tTjFRnczc
	p1cMmKUHmgpE4IET02hxk+/L5x2B2PtDiErdUm6UYmT9q2rM5RW4PU1eEfBNEZfJIq79b
X-Gm-Gg: AYBFou38ntOLvtmTycmplxCtc0whG0eWdPJLi8rok+xoKT/4We8mkUpaujMYoklhMlR
	lUuGz87BWwAedcQELSX8sLnFHSTZ7zp8l3pIh7v7lw/m1kepP70JYvv6TMqk5L6vl2hrzzSQ4q0
	ejvhpja0/iG/GYvH+58XOcF82sJ7YkIS/qK0VWqBqv8LYGDHhZ0sJFxAEQbaSpLPU4LmpCfTDXZ
	diu9CJnQRR9EkKFbHpejT6xmC3GtS+tj3a8+eK/cYFPP48zZcdbqmE0dFI/xNmjshQcJRqla5Bu
	ifbFwfcXxLk+R3w9slCjcIzwIUcq/w5kCsCNnFyo4Cp2PyeuWS5wTRXQlkxONKiYFPF5f5+gVgn
	32dPYSGEgiNLAz8iOsYjn6ymTHmUY8bSU14tJwi9pnLbzyEgifoklfpVE
X-Received: by 2002:a05:620a:268c:b0:949:698f:8bea with SMTP id af79cd13be357-949996896a6mr571641385a.34.1795019030546;
        Wed, 18 Nov 2026 08:23:50 -0800 (PST)
X-Received: by 2002:a05:620a:268c:b0:949:698f:8bea with SMTP id af79cd13be357-949996896a6mr571635985a.34.1795019029889;
        Wed, 18 Nov 2026 08:23:49 -0800 (PST)
Received: from t14s ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7843bd79sm153190055e9.14.2026.11.18.08.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:23:49 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Fix touchscreen power on
Date: Wed, 18 Nov 2026 17:23:43 +0100
Message-ID: <20261118162343.16197-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NSBTYWx0ZWRfX4u4Wi5fRjpyQ
 jZORA4bm1j/F81Gv44/db207YxgHP96oHH3YPurxonTLR99LAsRkRnhxF5JWXj/6YeKAVibPkAC
 ZUKM5YDfm5JfdVHbeQ3SHWJXb47Fnyk=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afdd117 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=rYM_yondQcVyUL2waWkA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NSBTYWx0ZWRfX7DOBLbYXtj9l
 rRN15fGdDUyhJ7vlz+ooIzRb3z7Vq1Zn8OlAln2KoXL2CLY+rMrx1JeiDQWavfu3bnannbmOqSR
 e3V/6QMZbWzi7Ef99QBtMjZDDhzC9MR2/uE6QQ/o5fe9EDJqvVdeZBGrjwdc3i5zcZPm5FpXhLa
 WEBEpYoO1a50pOcP2IfMZvmEZyGe+00QvB7DfuvBv40rmFWy9f5LGNEKAKlnMYo4Su0OPJ4q10E
 4LhEKw5lPJySEFhZlNLbIilXNmdiw0tBefolMoZjdI6hppLvsubRF/EQcwsrCvrustoAjYAoWDa
 bDumY9drfN+/ilMupAGYV3wrg6LRBP86JkRFqDwLVqI2EPBFQD9gWWdnc0yjS2O21CjaZjLR9nI
 DBQjqsXZ0sON52ItYR4ULLK1IOL9nh1GPgyEax36J1Z6eMhqi/KU0OUQz+ONyoQ7/HdujZ9qPHk
 VRMechv4vdZEVAicUPg==
X-Proofpoint-ORIG-GUID: o7X8qJs9x6_w3tTqnlFzsrTgGItpTBnf
X-Proofpoint-GUID: o7X8qJs9x6_w3tTqnlFzsrTgGItpTBnf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180065

When the i2c-hid driver is builtin the touchscreen on the ThinkPad T14s
fails to probe at boot. When the driver is builtin the touchscreen gets
probed immediately after being taken out of reset. At this point
the touchscreen is not ready to talk on the I2C bus yet, causing
the probe to fail.

The touchscreen on this laptop needs a delay of 200ms (taken from ACPI
power-sequences) before it will accept I2C transfers.

Add a post-power-on-delay-ms = 200 property to the touchscreen DT node
to fix this.

Fixes: 7d1cbe2f4985 ("arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6")
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes v2:
- s/touchpad/touchscreen/ in commit msg
- Add fixes tag
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 7c9424248120..16b25e596f0d 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -1349,6 +1349,7 @@ touchscreen@10 {
 		reg = <0x10>;
 
 		hid-descr-addr = <0x1>;
+		post-power-on-delay-ms = <200>;
 		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
 
 		vdd-supply = <&vreg_misc_3p3>;
-- 
2.56.0

