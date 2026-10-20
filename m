Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529198;
	b=u0AQgMRonDtkuaGzBxPygBEqzQvK3V7r0z2n8qsvhOR9aYJAKXeQrIGEcNfWL7rOadf/
	 5z7vxDkLTajJUaaR+iSY9KusX2E79CVbzWAtwpJIeILyITPt4EXMGPrPldTHV6/Xf3wy/
	 REIM8dydAR0UxjmEJ5KZZgp7R5CWcSjS0p2cFOOzxzERkw7Q7laXljWhq5EUGVMIJllPs
	 sLU1AG/5Wb2f+GwlOQ23V4cDgtB0tOuR0DsTs9mDGj6F1UzG4OQ5E/Nj+hPi7WStKcz5d
	 HimAODIsVMhg1Sa/X0TDZP//r28AOSNPuihM2137Obg+i8VXMBGjiRj4GkfElNyCvAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529198;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SzV5+z/r8UMr39IPMHzKFVdGjgJGBmTzawGLO6TTG1M=;
	b=DKqemiLoLDQ194eEmdaXSeXDiLXnaxjI3zzScpuVNBR3HwMmWTyAiiVZ2APgq2jYJOTp
	 sCjrkxhj2qpbZ9NbN6No2HeIiVm3lG69U9t0hR7DizDWmYzKh0giJX3fyQfawtG3JX03S
	 mCcuM+9pLE4JAgcm00Q/LGOrOuFvAB06+9DpKq1C+LHXkz4yYyjDypY9mZTMvl9NkEyT+
	 nlibactETVwfH5fmwfONUqXA8Iw44qnkgN3kIt7FKTge55Z7iBsIhH/61F+964jUhaPzb
	 p2bYmD65j+HN+jyFMqQvB1JUbLLbbUa7FBpWIoU9EjLQHWEi5tyn2rtIm5bBrjJMt0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DB7eOqrC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z7jw5Rjz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07C4606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C07C4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DB7eOqrC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z7jw5Rjz
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KGtlxm2278771
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SzV5+z/r8UMr39IPMHzKFVdGjgJGBmTzawG
	LO6TTG1M=; b=DB7eOqrC2guZxfoLr+G4n4ZtWrYGktNhRE3vBY0pF5hPHkvrWmF
	34qH7x0l9xlRKR6LodQf6rhIUdPOemOatoAlminkuHOtnGzT14r4oY45IIKGWbX6
	mtA9wx0pNynHMBIXAutXhzfCuehup8KBY3fdNQ+Nr2uPIitvwSlI7rSCd88yS10Z
	rzKW3xQNqX0We7vF7ma2//QedQ005HlGR8j0E/QbBoCvhYqHyW+RtKq7//pknE+w
	wZXfwRloKhcadRTq4N9jpJfP0gg9g7jXCU9ryxipK/p3Mqe1gnNio/IBl9R+7MJO
	eKMnbApzfIf/NkZLMhRfKSihfo/Bfo1eNCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2a3kj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:46:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb98809caso12972885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792529196; x=1793133996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SzV5+z/r8UMr39IPMHzKFVdGjgJGBmTzawGLO6TTG1M=;
        b=Z7jw5RjzGVKrvXH8QpFELrryn+h+kXwAUS5+gc0poBLNpCXAzqhiyM+D9ESGzuZXxu
         99mP1qkAkayVn9IqGaPqx/vVZtBQmY0RIqaqJm9XvWYQuzwfUuyPxYvBCjiQGG3p9ZTR
         31dGiNcQyWSZBX5qh0GTE0Ata4XyaFz6591YHFvoxZjpA8WCnJYKPztwXL3WvxuSTIhF
         aO4vxWEP2OQx+N/J9bJESKZ/ZPEKjvDgzoCrSVyj9YepO79IyfzPLQmjw+D90813ja1h
         VoyZh63WOAoL6tVMi2Q83bFt8vhcpNtOZlLJhdXIU2WDpq/NR3C/P07P/Kbhv5uygm7p
         hk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529196; x=1793133996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SzV5+z/r8UMr39IPMHzKFVdGjgJGBmTzawGLO6TTG1M=;
        b=1Ym6qDujBaMfdZ+ztOiRgcgQ5vW3ubR3j0WMbyvpIjtz9QQ5n7EauY4IRz22Bbmb6b
         MD26kUkPLIysLviZI5nKEGJahPjFBnw77bZ9KWP97HuLka5KXwfn5GRU18SGeEiKMXZY
         9HKKBWdMIjfiMc3Co2wmAk6FHS7P8UwXu4qvpNOONSBPIRoFpF5FcsVVqK8d7G+KJtH1
         auWrMM03YQbhZu+XiB2M7pyJ9QV54UV6TajubKMaFLagwKoGFPWx54vdxN/DE2yXs5Mh
         SM4wxp9SCPjXIBiAjk7/5RYj+fELEuMlrsYJi9Vpj2VoUELySF47XhD2cvs3PyDrXf1c
         xZTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWBrUQyIHjGRdRibf0Vafd4yPdDe94OlEit8sletA5FFaBncSSJcUrojrvSQ0WKHVVf/0WY4M3rRD5J91j@vger.kernel.org
X-Gm-Message-State: AFq9FYInjlbCMqPU8QG8kmyxMTi+WjKrjfvMHrD+fCwS5z8gvkhJ6KM7
	vaRhrq9IW7YJllinfyu94mUPLfOzPRlS1V9rrNilBRX6JtnD4w3Zo2jj1dHJ5G1/fTj32e+/7Mh
	8oNfuQz+mmpRgUNoXNwnkROIjAr2/83b+fLGXeDLNgP9Q2CVzi4r9dG9l+OriQU1XBHC+
X-Gm-Gg: AYBFou0wkJEVoqe3jPcEAnIl5/nUE3aT3k9R475AomqndBFekHFK1XXMqXIF+5jec53
	x2s/wwqLn/UzOAfUQoH7+WZjhBpR2TViETlLS6jXvzfxPx0LGmaMs1XrbSej6CBdyY57DiDxwIB
	fslkzcGlJoubu6+P2CIHEmT4NufRkZie1PkRdsQyQrDlT5AJnptzDITTGY6zkpDYTHkPlwxSSEA
	b9pOuUE/he+Hn/8vcE4tHN/x4T0zJoJK5SEbouoC5N7NgAKk9tZZRYvyKrumYfdpp4kiIO7HdpC
	HL5Cw6LwEXuYds9XrLyLwHLmeIL84nT0EkPo1XUA8mk+5NctShXeNEHfZ+E/3dd4MRVUorewnwY
	IBtqYtKtSRdBgm9eNmmLK8pO6iLrnC30ohUMeNf/tml7h
X-Received: by 2002:a05:620a:8006:b0:93e:bcbf:88 with SMTP id af79cd13be357-93f57ecf44cmr75478485a.4.1792529196088;
        Tue, 20 Oct 2026 13:46:36 -0700 (PDT)
X-Received: by 2002:a05:620a:8006:b0:93e:bcbf:88 with SMTP id af79cd13be357-93f57ecf44cmr75474585a.4.1792529195574;
        Tue, 20 Oct 2026 13:46:35 -0700 (PDT)
Received: from trex (50.red-81-37-172.dynamicip.rima-tde.net. [81.37.172.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd59482sm4536935e9.4.2026.10.20.13.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:46:34 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, abhinav.kumar@linux.dev,
        bod@kernel.org, mchehab@kernel.org, hverkuil@kernel.org,
        stefan.schmidt@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: qcom: iris: fix PAS ID passed to set_remote_state
Date: Tue, 20 Oct 2026 22:45:57 +0200
Message-ID: <20261020204630.1175058-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
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
X-Proofpoint-GUID: BEWMe_5pay9lmk81d-TVwFnIrZKUS3c7
X-Proofpoint-ORIG-GUID: BEWMe_5pay9lmk81d-TVwFnIrZKUS3c7
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad7d32d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=VbO86HPdXvN82gCvB8O6pw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=mLYu_wAyvM-e7FxXmqQA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfXynFqPaVvzEkz
 4SWHkY/WwtXzbngPZcBvhxs9OdEE0OWiqGMZZ9QSzTXDMTGfpWrQVs/jkHzXXTr5dUJdZt7xCb7
 ABQHcmPMB1Z16r3EFY+Rs0eCjglKhMY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX8LcqfwfK90PD
 xC/E6cpObO7Pu6LmFILrw3fhjfC8zzhEMediLJ8j4tJKNwah3hmOO4Rj54QMnh/VOu/Qp/hFaNx
 nA6NwTy8Wg1Ii2q6m7VB6dKW9D2XgFuwIkxEm47l43EuTdM/Kbrj0qENBRc/nh0V4oRRosYEhaD
 MsYlPrKqUYnNZ0ED5aKa7QFM5Q5PWozDg5WMUPj6MNVKw7tgT+8RgiB8Zm9K0iTXcIXlAqXuWhA
 vg/jlJ4knUMgMezjjV8mKhP1Xh/9aSgK2fjucvB1KZhuhCTasdcpn5qQl5mR4mOg5ymvvcRGEVd
 U0K7bUVxI1aBfdCE1vVouONIucuzeVY7p0eLUlbuA1crJu5KKDDYgKZmY4cT9Qgn3C5KOTx2JXm
 S0RGU8g+w+fobWU3e7QicCEepN4DYYzWJ/CnlpLWjojSb17vCfva0LdIk49p2cdiGRf1HUCA09W
 2OJ8ygkWHOGXaE/HNFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200082

A PAS ID of 0 does not identify the iris peripheral, so the
remote-state update never reached it. Pass IRIS_PAS_ID, as every
other PAS call in this file does.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_firmware.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 21cdf1c39835..6ff5eefff391 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -195,5 +195,5 @@ int iris_fw_unload(struct iris_core *core)
 
 int iris_set_hw_state(struct iris_core *core, bool resume)
 {
-	return qcom_pas_set_remote_state(resume, 0);
+	return qcom_pas_set_remote_state(resume, IRIS_PAS_ID);
 }
-- 
2.54.0

