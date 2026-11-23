Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442180;
	b=3EpH4rxRat9p4h+9MaT39K2eiVfIWFaDZK5dAFG4L4bxQR5qHAZhkS0gLKu7JGgy+dl5
	 qQl+AQmtJVoxwYZDvs8d3+yWcJU0FjVjvtrg0CL+o4DRYHWmK3hNOTaZ4mlP1GDnLEFei
	 PlxEcP495QxwbRwynZyswMCHginfwVR82b2BjGr7cuSqFASjV3jBfD87KI2A465WGllg4
	 kE1HWdci3/hMJW0FQcbNJqv9ms0yHWp+Zyr3sAYi68H+yl1psJardkB3mYWNIquWGTRs1
	 rtjL6HExR1WDP52rLucXW8vh+Yuutv3Uo5ZADiKshRXlieADJMlpYJFPiGPb5iU7cdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442180;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=a5Va2F2EmJxKCX71IGxuO/VT6wpOAYxJK3OKtAsPW2Y=;
	b=mCNI1re045makrEkOTxsNM4amWEzeLs8OlRfehEgJewbvZjmHoTr/HBKa1da72nzlt6u
	 Es+QAR+6Og+PpRh8weJB90NTLr9HMgKXySEhAAp3JGtxxxhPBPYzLK+2NoLN++6oRxstH
	 fGZ5wlXVjCLgC4K8yr8+TkqDgh1gLKNIHNJhGJjMoEGFBt2vKVs83aEJKoCNwxXow7Iyw
	 8w6SK0s9BCsK0YyjWcpqEFa0pFS0aVlVs2AmVLrk8zXp5GyQvRS5i65gOgaWVBa6LDIZc
	 2b8SRl8Lceh94D8KZijX7aDjDsimUNlT+dCmpfpNN5fh5NoAjRS5+ROyLD8LTdGo9Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OPz1nG6Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ihsgwavl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9758360A2617
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9758360A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OPz1nG6Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ihsgwavl
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKv9I1974195
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a5Va2F2EmJxKCX71IGxuO/VT6wpOAYxJK3OKtAsPW2Y=; b=OPz1nG6QtqvIY99R
	0o+9QwtfAkRZRg3EX82sz02jE/W2gYYcXfYGAeun/FnN1X+ybipWWnkx5zydDR44
	vhpmn937JJ8xY2FqFNH57FRsE9AberMNL+oH1lFoUkKem9IOaZ6TAy7nDwm5rTEO
	Zk+zPbmZvBWA/K/abFU5GYtulpQf8TrC/jdYEZ2ROs1eTah8on57BJV/EeYeybWd
	yaUpQsjKO1CtvYKvMPze8OWzoV2X4XbOjmH2CD2ncePKX8LEy8oErwi7PqwhkKsq
	5yomR6mfRdJqHiIcOq8YroygOyIN9nRcBRbDsiGp5HKRn9EFGGUiqtvKKgxJBn7O
	/OZWpg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7urkkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:56:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-949b0d322fbso484578085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795442178; x=1796046978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5Va2F2EmJxKCX71IGxuO/VT6wpOAYxJK3OKtAsPW2Y=;
        b=ihsgwavluhvVp8oGwO3hrlf+SR8+eZcJsJyonoQFrzfXF7HsLHP+YqKLoDjkOonBJz
         UTZqBC+OGL8s+nXHU1hDpGfBuVjavKyK03ckMKHU51Iia/gXAHID7gw+iM7G64/tRbFD
         cPkS1Ym6avMv8lzQCIa9RMMHo20hOu5+W+UWzg2aAZ/tb2YrM9BitryrkZW392uPbFwf
         DRSzdKJtnvSfIiUlMlLZbyPHP1HjGgkZJGpE3MeVtBBgRrDL8bsLy183QUNyyCmfLxxy
         zRcaZQYX6oYWCTKs8OzFQRh6NGOQxbuhyPHsJDfWUNC3VN2yaeP877A+48bZ7iD0qZnm
         Hd2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442178; x=1796046978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5Va2F2EmJxKCX71IGxuO/VT6wpOAYxJK3OKtAsPW2Y=;
        b=SFgAZsDDAgiuBb8OCD1SAmJYotdEMFW3/3ql/n0iNu1+tjPQq7KW41/DjLWfWygQbY
         gNojwM18sy9Am6d2v6odb0PZLfHPdX+FD+qlyPOc0wxiubX+OxjfGcyJLTBXqjDTJQNA
         2E98fzVFw9ihOb5ratRb8t5OIsFRzNAk6lQVEA1Pp6CVepwdzISx7Y+n3p4UVIVDfZuV
         QQQPNb+IWwm2ZRBgTxeHMz6Gjogy+m0gj6pMLxinwhSgwUiqc95S9vTuli9BQh4BeUGH
         b6RRQ2T7W2PpbAIyNFzOPiYxRoItwCtgaxC2kIpEayQFhrHHF6b3M+3qdmJr9oPEn4cg
         5Utw==
X-Forwarded-Encrypted: i=1; AL+hErHIHg5G2f882FF47u5MiE7+7Zp+JCDU1OHy5MFpo0Wz2bSdoVypFC3zk0xwwxx3e8TQQrTzvWg0Ad4UqMy9@vger.kernel.org
X-Gm-Message-State: APuU4Z++zUFvg9oG1hgOJcj+i8g8P6C1p9sgSplFy7hVPNfTBE6u02xZ
	kiy6bUkQLYfR9Z/x1M+7GsaQCLsz8OQziOLSX7ODF0zsAJ7QeRyIvNBfc1rEmTIcEnw68VQfRHA
	Kkf50YMsZnb3TmYLMAwkdOS40COEFTMW4Sk/+h6xLGiWybKYIfHJj3lQLbbRquEKJOj35
X-Gm-Gg: AZFdTZdIccEpeFtqG/nMjiTNSMLuzUgoqSgyklP1+fbHot6hzTPVpe4LH5yG7wlDY0r
	l9tEVOSGboNQHQcHoI0eUh1p9tzoiZxw9jgArZhBcXjmc3cAweKqvakn/NJS4vbD9vZh9pmqAJk
	JxVvBEN8bN7dIP5a6Ue+4ePKaSKsIXqTkUlxHn4tacjrJP/xpXHEA4k4KIdQr7wAKX3ncKlmtec
	liMQ5R3rhSI8Gu3UvQcioImCbk9mi3RwcksdnoQfQTNiY18RaSZoJKkHS5fIPIHByoOyRIharL5
	yfgo+nkDJ2fuTQw9l7c+HbhpvYU0tRf80zWYtKa+x7bc0EG0NtO12/WvykmHXyHtY/RqYErHteZ
	wiAd+mW86ReqYWyEOfXAgV/kr+7zcW/OMCQOjDjz3vIRdnINhx+v8cR1BgzQqGp7AbP49g8kpsI
	ZdvpBCpYz/YRFchfZm3c427XhdZvJe6oFEtFVr2VehxZekn/bLGTrcAl3f0/n9M2LxD69j0Z4Ct
	8F0MYFGnK8Jv+y4D+77wGdw1O+N
X-Received: by 2002:a05:620a:2605:b0:949:6d5c:3fff with SMTP id af79cd13be357-949ba9acf03mr1821252485a.44.1795442177783;
        Mon, 23 Nov 2026 05:56:17 -0800 (PST)
X-Received: by 2002:a05:620a:2605:b0:949:6d5c:3fff with SMTP id af79cd13be357-949ba9acf03mr1821247685a.44.1795442177277;
        Mon, 23 Nov 2026 05:56:17 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm21724625f8f.56.2026.11.23.05.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:56:16 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 14:56:10 +0100
Subject: [PATCH v9 3/8] Bluetooth: hci_qca: Set 'bt_en_available' from
 pwrseq controllability
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
Message-Id: <20261123-monza-wireless-v9-3-450d7d764aea@oss.qualcomm.com>
References: <20261123-monza-wireless-v9-0-450d7d764aea@oss.qualcomm.com>
In-Reply-To: <20261123-monza-wireless-v9-0-450d7d764aea@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: Icv3dhlTany-iy36eS2q2WRoO6sz7fXX
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b044602 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8YyhkPy0JF_pzLATneMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Icv3dhlTany-iy36eS2q2WRoO6sz7fXX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NSBTYWx0ZWRfXzI62mufdbnk4
 PZ3jqKgBbE0S9x3yNYuXBFJregSFfZS930OjfM8CogUCSFfG8Re6Q6pWxWibWJTIUTbnR517krR
 XL0Fea6Zd0ivZObTtkSyoHJn6MtQTDU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NSBTYWx0ZWRfX9g/9F7KmoT8L
 lZ+bzQumiFxIX7X5rZ2gC0Ls00/TH7ggzi38qLacVu6atTAt0lv6IkosqEw6PaQVvb/8/YzpFKt
 BA7CDc8XBuRrOv6f/K0y48usebFFdxJlL0RfWFtqr+H0ndhALh5jmPXa/F33Is9E1BX7vtpZdRo
 sJouiByZM+yX7/vysJwH32GIxuMPnQPOUFLWeIwzQ5+EVBebvpgDZrUiahiWBgytN0CqtQK9vYM
 tuIkGWOrGKbOP2HTPOeCelNqFsfDerW4GTkqkLA9Lgz9xgG1BVwGwgF63J+D3KlD40JlatDp3jn
 7Y+XPai5Q/0kbAMebDoXICSnQCgteGMQHVkr0P+DggozAFGwYoNNgbYHiRkaCwJEqmQVTAW4NVD
 V790bXZuwz8J3pOOOCHIwPiygEaCfqwpKffyL1vvjzgXAVl0Sx/K+wzWpa+hWJg2j5hXNukM3xS
 rBhytDxL0x/0FuslFQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230055

A Bluetooth device only needs the non-persistent setup if the host can
gate its power, so that it is actually reset on the next power-on. When the
power is controlled by a power sequencer, whether the host can gate it
depends on the hardware wiring, e.g. the presence of the BT_EN or
W_DISABLE2# line.

Query the generic pwrseq_is_controllable() helper whenever the BT power
comes from a sequencer, regardless of which provider it is (M2, WCN, ...).
If the power is not controllable, clear 'bt_en_available' so that
HCI_QUIRK_NON_PERSISTENT_SETUP is not set.

This is based on Manivannan's original patch that keyed the decision off
the W_DISABLE2# device tree property, it now uses the generic pwrseq helper
and handles the always-on case.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 5544dff9d10b5064797d41294b126fbc229a8dd5..3c0239e837fed7ff8d8261b0c61e5163945d157b 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2632,7 +2632,24 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			return PTR_ERR(qcadev->susclk);
 		}
 	}
-	
+
+	if (qcadev->bt_power && qcadev->bt_power->pwrseq) {
+		bt_en_available = pwrseq_is_controllable(qcadev->bt_power->pwrseq);
+		if (!bt_en_available) {
+			/* The host cannot gate the BT power individually.
+			 * Treat it as always-on and drop the pwrseq handle.
+			 * The descriptor itself is still released by devres,
+			 * so dropping the handle here is not a leak.
+			 */
+			err = pwrseq_enable(qcadev->bt_power->pwrseq);
+			if (err)
+				return dev_err_probe(&serdev->dev, err,
+						     "failed to power on BT device\n");
+
+			qcadev->bt_power->pwrseq = NULL;
+		}
+	}
+
 	err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
 	if (err) {
 		BT_ERR("serdev registration failed");

-- 
2.34.1

