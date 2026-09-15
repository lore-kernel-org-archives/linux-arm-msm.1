Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718CF48EC87
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 13:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478830; cv=none; b=L121JUtQH6x+Pw24CVhlQFKoJNpRNpHMuWv8quFkSHEtFobU9mvvqWAze9kd103gEKvglsIg2FX43oD7HDImjTRGhVvhShOfPgUfua0Yar/jR7oYDPErKHPm0+CZX9DejO0XYxmt5qen0H++BtnKiIMzixBhaOvFXsjLHLhNiHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478830; c=relaxed/simple;
	bh=XMZcz6kYBdTUSQPlM1s/g5+gV03lvS/f/BpAkn8eNuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pNLXwL0YuADWtBzzXE5M+k0c43TGMIagsTa9vFUwJECOVxwsrxxhCP7ajeS1pW1RIFuqKOGq9CCyDiXnSU1FPez6oRPR3TwwluMcXKGVZx47jpq46kAVGWSPfnWkxF9iPK8+h40nMBhmFnVc/iRuTdXxvPjsO7T0/Q2TfFx525Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FuC/zuaB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cxu6MCYj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FuC/zuaB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cxu6MCYj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD04Ir3112339
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 13:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lbqlJQjQyZug5ULzZ6y7JKD7Ojfb/phQ4FDoOtOPOVs=; b=FuC/zuaBUxqxNEe2
	qH5/epyShHcCw1cchQDsHN1wiKCMlgk0NU6hwCQWJIJrknym89MmBUggFQo/FF2A
	qWF9kNstIb7t0OgUOqMzez26mOrD5QOUzMjTybblCQSGXS5SL8wTlPpThQbkk1zo
	/0AJ/ypH/tMncHakRUBBRssr6XlouefATcBULaaTKxkTcCnrU9kqpsKTulisBI9o
	Z3zc3q1vdGdl9T6tX3x5npDa7MWGD3vx3llrvqw/ii14KoHvBgXwg4ZUlW0zWldM
	4NfLraK7+9MxB6BoeRP15tlTubLnhmn6Alx7Itwa1Snr/n6OlD+8oZ9d5rPLvbVB
	+mRd5A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpye722xm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 13:27:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a2d361e1aso364726185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 06:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789478828; x=1790083628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lbqlJQjQyZug5ULzZ6y7JKD7Ojfb/phQ4FDoOtOPOVs=;
        b=Cxu6MCYjLwfH5y42FpEHBxnjBYLsFhAkf3OjAur67+nkv74YpFGuT6jlU52el7jft9
         eDFQ14StWqf5SYm5WhzL2gYGH+VmtHG4vRQqdULLJO4wKnprQGJzrc5bdOljwSCI345v
         W/rFD2YBJqEubgZULGk4HocPngo1ZiLSxj/TFAxeg8+6gyMMwapinbFmxJuEze3y2Am+
         3V3G9WC+0K3O3uar/D3jP0NzmilVZ6KOjEGq8dpeVKUR3VPioWGPhOz/lxWEUO0ydtxn
         6Mh551wfpLWzuLqv+0Hn10fzOkESHLcMtkA2/IlndsuqWbGozJP+J/5VPkMTNFYWNlzE
         3zYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478828; x=1790083628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lbqlJQjQyZug5ULzZ6y7JKD7Ojfb/phQ4FDoOtOPOVs=;
        b=TThkWzOGqOgack2lVvUXeZzYcyvtXNyFrwWixXIgxroohqOpi8CeU1eSmTsKR9s6k1
         wkpMkO0y3L43fdeK/ju2WE3g3W22oeD1HhHsi5VLURWGRmky9SIXwgfueBJEWhCRs9Bm
         1azxqlTpKVjxRYwkeu4KI/MqDz0hOG4x6j+hlqt5oNOA4KHHhgYv5GJFnwdcIRJfCENw
         XVnvRXFZntmEYVJNKe+yU059e0jkTxBEADZ7Pxs7f/pSvNOe+SEg27XD5ePaKdaIAwB9
         qGrjY7igENqBiJpcYwWrZWRzPMhzPv8ldpA4NouoUUjQTdMrxSIEZdjcLTkFH8DykZzx
         Dm+A==
X-Forwarded-Encrypted: i=1; AKwUvBzL5ZOyxltoGCXYDByScPTM+cT+9ogl5V47wGNDnejQAHfJOiXmu+Rze2kpFqC5hDODt53WE5IPoF0QP/gu@vger.kernel.org
X-Gm-Message-State: AFuF++lx7rt26Tyb7/5VT+0tt679b5bNrkF7f9LoHWUjtSCFECQr32BC
	Ofdp7POBECGkWhBr5b64fWFUXAxtfh+/yMzqaQ9QZytMXeAVb0wADFwKCfRfH7AHRq6CPIiQ9VF
	uIQfOpHMVi9ZJG+y/npxh/EiE7+kp0yA2fXwULlADFG6fj5Qx8xgX0tNl89XoznzVl4bT
X-Gm-Gg: AYBFou1WQ1fWOUEItmWY1NKIG85PcUYppXz+TO20rgwrix/xnNiPbhag932V4hDhnWY
	4tbZ76fnDtZQ7HfrbTt+cejMh9BKE1aOP60kNAFz0wz88TPje++OAGevvp0wpl3mWW7h5G2j7gM
	6+R7CiemmJIN8oHmI2XI//BzmKpiKeTJ/Ta+DhJrpPHioUvigc3nH45nSqMfAqUXKm/91AYmN2X
	hZjRg4YgdVFOiWfM92C1CHorDsob60CjvbJAYha5V4kGvxNGA/kzYwXo5lWdP+MyR1XkJveQw0Z
	S7LxOT7dDnf6zPKMEDKzuGGW2BSQkf69lbv7yF/biEwB5+ctF8s5cLXHf7ja7L7AfS7IDOBTJeB
	sxCsg1EydL6UuIXSVrw5eqOmbD7EHlXZ1ajTm
X-Received: by 2002:a05:620a:468c:b0:939:d913:9a74 with SMTP id af79cd13be357-93a29bbcd86mr982049285a.46.1789478822884;
        Tue, 15 Sep 2026 06:27:02 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:939:d913:9a74 with SMTP id af79cd13be357-93a29bbcd86mr982044885a.46.1789478822427;
        Tue, 15 Sep 2026 06:27:02 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80bfc90sm1248906185a.37.2026.09.15.06.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:27:02 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 18:56:28 +0530
Subject: [PATCH v2 2/2] tty: serial: qcom_geni_serial: Keep console RX
 functional after deep idle
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-correct-icc-bandwidth-vote-constants-v2-2-f78eb611204e@oss.qualcomm.com>
References: <20260915-correct-icc-bandwidth-vote-constants-v2-0-f78eb611204e@oss.qualcomm.com>
In-Reply-To: <20260915-correct-icc-bandwidth-vote-constants-v2-0-f78eb611204e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789478807; l=1650;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=XMZcz6kYBdTUSQPlM1s/g5+gV03lvS/f/BpAkn8eNuA=;
 b=nOXSuI/UktldwjJpel37rGs1AWfUJDxcbpM3fdZBFC5keaZcGMeKYtaK3LOJa/rHbkvaviqxI
 Lt894M0YUpnCrdi054NmypRms2gV2khkH87fVp87rBot6XTAaGyEhGr
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE5NSBTYWx0ZWRfXxOvqD9orLc5F
 Pd+RE5/KGcI5/nMSi5eVD7CE9DaHC6Z5jv/anE/ew2+kayWQ7/fv3qEQrsKZRvVH2JU3MDijfNx
 gjUstR6cgm5WkjZ4tvIsxLv3jHNAL6yGGxd4rGI3jNJRNpbo05TnZv7R4stWBEJ3WEoRJJMCAd7
 srfbzBuFZupPI7XR04ihW6i5f3ZevHC/aKtt5uWEHxS9AfV2wCxZY/T6dFgvkZtD1SurVszvfTx
 iSCRlMIORTtTbfcXWvjpNgJCkXJKlMCPQWzSCqWEtPNYmM3fwRHlPOY9QoztsB01cKAtLyv/QmD
 09IAONZvn057G1B65UIXeTEb2J6Ml5t8dNe9r53oIpZXIZ126sQMZy4h4OPy+6lOscq3aYgBuGe
 nw7vWEHP4SvfmcjBueo3/nhMzIYw54wtsZup6vYtiEVj7TUeGyUZa4yWo9lR8JHHzgSJVxxzdVU
 tTikzoCAd0Zx8e3sxeQ==
X-Proofpoint-GUID: ReLRkEBHOMxQjI1JSRjCQiAdpdmQY1V-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE5NSBTYWx0ZWRfX1O3r03P+wWyI
 uXgcosu0ZpMgDPH72F1oq/DKlJS9gqBX2T07MGorpJRCiBdYFjgZeYzWO487uVaqdZkCYg8OSoX
 8P4MCMp/QARox97pGGMoYfeB7+Uc6YI=
X-Authority-Analysis: v=2.4 cv=fck4WEQF c=1 sm=1 tr=0 ts=6aa947ac cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZOf5TxNYE7tYtAAs_IYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ReLRkEBHOMxQjI1JSRjCQiAdpdmQY1V-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150195

At baud rates up to 115200, the serial console uses only a 1 kBps keepalive
vote for the GENI_TO_CORE ("qup-core") ICC path. This vote keeps the path
active but does not request a QUP Core 2X clock rate.

When the CPU enters a deeper idle state, the missing Core clock vote can
leave the console RX path unresponsive.

Use the 19.2 MHz Core 2X vote at low baud rates, while retaining the 50 MHz
vote at higher baud rates, so that console RX remains functional after deep
idle transitions.

Fixes: 7cf563b2c846 ("tty: serial: qcom_geni_serial: Add interconnect support")
Cc: stable@vger.kernel.org
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 3633723acef8..f7e81b652255 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1482,9 +1482,8 @@ static int geni_serial_set_rate(struct geni_se *se, unsigned long baud)
 	 * Bump up BW vote on CPU and CORE path as driver supports FIFO mode
 	 * only.
 	 */
-	avg_bw_core = (baud > 115200) ? Bps_to_icc(CORE_2X_50_MHZ)
-						: GENI_DEFAULT_BW;
-	port->se.icc_paths[GENI_TO_CORE].avg_bw = avg_bw_core;
+	avg_bw_core = baud > 115200 ? CORE_2X_50_MHZ : CORE_2X_19_2_MHZ;
+	port->se.icc_paths[GENI_TO_CORE].avg_bw = Bps_to_icc(avg_bw_core);
 	port->se.icc_paths[CPU_TO_GENI].avg_bw = Bps_to_icc(baud);
 	geni_icc_set_bw(&port->se);
 

-- 
2.34.1

