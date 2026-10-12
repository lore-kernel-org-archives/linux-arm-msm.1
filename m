Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3B33E450D
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 10:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800356; cv=none; b=daiWqeDTPvp19tUSxhjd2/8wNnncuPqrLCr1NfFFWQMnddCvf9RezW4DyvySWcwExfNzFl2FGv3hZ0OOfet6uDrrIzKtSMXvmDRxoQzdjAXikyHzlcJasyU1lpr8wE2yBOc3hjKSZLXUTQLcyYZnu3pKu/db8AWQyDIFfUPNb6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800356; c=relaxed/simple;
	bh=bbKjj1C0Me1kB2gAMk/MgjrJQ9ZuhQvmZb10mxHzzrw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JJRH85lE4Gp+PVJsLY+HUEvWKTdM8kaVSUP6u+cgDQOJ/Cqyjf83Fs3QQwM2Lje8f3m8tj6V+6Od1uBnv7ZJ8KeN36k7s2kw3h6H1xqRKCsR8krbXXLGvJdf/emx+K0HIX5a/8cCT/CjlALWlbUcxW7oJVFUdG5DwAevgjQT+ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYsKTKMO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jxUG7jtE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYsKTKMO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jxUG7jtE"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KnoE1593601
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 10:19:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MrTikc7PzU67E1D6XWu5lp
	0nNMPg3MxZCKmkjWFxU3Y=; b=TYsKTKMOc66u77Ln5f1UfNEJtTqshfPaGzRx/P
	H4tlF8Tssd5Sfb29LEzYGXX7aTvMZYviYC8kBjKg9oIUtb+IDI283giHe3mpm39G
	/+IKPkD4xR2gSkAWk+AIVZ5PX/yv8vldfYIeV+P+l9OZUi8cp5duJ8dwiixVvZdB
	0R9cQztDpXLzMjY8W3/2gKHNeCp8yokBYYnMQhxz0nnrUgVAfccf7PTP9w429eGE
	evvi24Nl8l3xomn7JkU/DhSFqmWu810Z8DUk1fiqL/jsqSG8xswQQlYSjfH3ebHN
	9gjI0GINYKC/VM27mWXsde7D4M5bGMo29AZBp080cz79a7wg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu180g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 10:19:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caa0ce0cdso179264785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 03:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791800340; x=1792405140; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MrTikc7PzU67E1D6XWu5lp0nNMPg3MxZCKmkjWFxU3Y=;
        b=jxUG7jtETdRAI805LzmTt2yIjeRxIMqH55Rugq8vV/wtpggEms1kI7oww6IQu1qjjK
         LAJ+Y+9i0to8q9dE/EgdwiYzU2f3bqZob8cWhZs7I7gOho01XbqB7NSg9CPDO52UiQjE
         Vh/Ukx9NP8HItKdbnuu89NuvQabGZLjRG1LJhtJDWyDJdlj8LNwT4ctEdHnxGjG2Ipj5
         haOFF2nQP1OhlohYcQPN/0U01vNP9+syC8HLC/n22uxfiNq2PVavyVjry3R/hlK/EwPi
         xpBIzdkI2fDlpzueKLPLZmJgAwWOrGd+t9HajibrB2kY4CVKo15Q7QdDsVzZaH12U8Pc
         9h1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800340; x=1792405140;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MrTikc7PzU67E1D6XWu5lp0nNMPg3MxZCKmkjWFxU3Y=;
        b=DRL5JiIjZYp8zFMQleCtFPJ5Mj+SJqQbTqh5wPb6VllzXkQCaaGejlB8nbuHgm1fpJ
         vAhLKdClB2lVY2LEPBYosUQzfYxjDm1svaqpVEiS3rCjoBOcIm44pYdX8bRVllVqWdMG
         mY9FTabS6fMrRfl7vtlab0HGO153ogJQHfF40/nbv/8/w7Ks/MmRg1g0YM0hpFQSjvfF
         T6uledblnPpVWg9Zo8SwuTRDGur65csT5Tqna5R6D1bPpVv6IX8D/va7xmp9DzPux1XD
         IrS3sm6w8QzGJRVDpQ1/0L/q4FXnY9vGIE8KyMJv8DjfX+nqYvftzgTcIAI6gZvtH3Xw
         swjA==
X-Forwarded-Encrypted: i=1; AKwUvBw0OD0foRdlWOyLU6iVlpSUUcEEcxZLckDeM/wIM9982Zle8mo7gaDmVHqLl5ye/qg+xGGgv0B2VL28BIIJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJZQc3YcKsqVS3ifvtIChxoV8XRhVqqdhvv+T2eq5yoPD6ZASe6
	IiHDZeB/hZCt2tbk/wL4laI7abwAae86uMT0DeqtonEnMWhoqDlZtEDgIYt4PDg/50/QZjbUzFA
	IRFP2hjkf4oo199inistg0Q6GP4CY+hmsr4UAzDgs8CG7OEg5YIW/GJg7IS1Eihnp3dn/
X-Gm-Gg: AYBFou0YbqmdB1cz5M4SB01XHVP7PxKQXJMvws9VU0Q6T9jrTe1FFouncMMQuVE/7uO
	Bf3USbL5KQ802/HcyfrKNHMpwaQUK/cD7NxEJ+RxP8fWeBYoSEspCiLGgKAgV7ksbRQYCLaHsb7
	+Y0OIdiJ26h5o04+7YDEqM14NAiCsqYNJF5oZyFAyOJJkI0SzGws6BR9XPMFG8qmb9hjRN00qPn
	myIgb5HmvekoPU+TrNMr4OjSU8QeqEOVxYOGQAq3EIOcYbudN0dSFL0bVNaRr2D2zkPvrhYTE8i
	k9r5v6PLEVExEM9ZX0plNqPfbCbCLKuY5/agA++GymiQDlXNgeR7UkM74e3q3ls3mTc7KuRSxCk
	6ne1UrSw87NRi
X-Received: by 2002:a05:620a:1a0e:b0:93a:2611:270f with SMTP id af79cd13be357-93ebd20ecaemr1562936485a.13.1791800340061;
        Mon, 12 Oct 2026 03:19:00 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0e:b0:93a:2611:270f with SMTP id af79cd13be357-93ebd20ecaemr1562934285a.13.1791800339512;
        Mon, 12 Oct 2026 03:18:59 -0700 (PDT)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e530esm17734057f8f.13.2026.10.12.03.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:18:58 -0700 (PDT)
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 11:17:55 +0100
Subject: [PATCH] soundwire: qcom: Fix off-by-one error in port exhaustion
 check
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-wip-obbardc-soundwire-qcom-fix-port-off-by-one-v1-1-81f1a4c9c73a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNywoCMQyF4VcZsjbQDt7wVcRFm6Yawaa2c1GGe
 XerLj84nH+BykW4wqlboPAkVTQ12E0HdHPpyiihGXrT762xPc6SUb13JRBWHVOYpTA+SR8Y5YV
 Zy4AaI/o3amLcHsi4o4uWdgztNBdus1/wfPm7jv7ONHwrsK4fGwhB/5IAAAA=
X-Change-ID: 20261012-wip-obbardc-soundwire-qcom-fix-port-off-by-one-47c0a8af1c5e
To: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2223;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=bbKjj1C0Me1kB2gAMk/MgjrJQ9ZuhQvmZb10mxHzzrw=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBqzLQNnUMouCxqa0nI4ulO401eVAkkBT/KCAh1x
 xd/bzoRe1SJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCasy0DQAKCRBjTcTwaHBG
 +P4XD/0SO0dEhLv5uR2QB2XsA4UnScmMXw1p6G8UV2rIRURPrqkAFogiVfbOaMUN0E/s0IOBpG1
 THqnL4cu81EgA7Y8CKiickQipViKhpLhBsH5U1zcZo5i3iJaY7vpyT/qlMe4EK8TVlbGzEPceZw
 ok8tshEnFPBo9WzyfJiRfCTA0dRnxmllD32sij9GyojzneMzbBCUadTiMcmmawG3VKyh06qP2Iu
 YbpfTsmuDJ3WgT2fS7n2HtBFp2SV49+5ZVpxKxJ9eP5YIoeoyeI70UTkDXtNzdKvaKgaOT04TJp
 B39otspltMppuUJ82+kodG9t6LK6GC8n24K4dYeB565jl5ATwiDR1qwqmW/KVc6+x6PCaZRF0ox
 Y05SiKYQuL9U2l3pPNYT4lEviMIgmWzRHGeRdH7+PEX3iMPNPLbwsScnyEBoHMBMQXQ48XLh0pe
 bDRf6Jeuet2z+TI7IrnSeOOZqb71afaj78RlSQUC3Q1Ow5unoQ+RfAFKVJc+SLUMwE9S9khePKD
 oW5EBipci1Tx3xFq8AE+JGUmtaTsb4kXf8V7E11cK3YzqLJIfypjcj3NnB5vrb9LoEkF8eg095/
 v8eEJ49sRuVK/VXMOUp22TSIcnXMjIZ1U35E6whoAHwhreWn/5jdj6+kkn7ZDWT0/hMVG/MSSJS
 RW92NvPj9nMumbg==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6accb414 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=WHBPfnyW_ekF-p2RvPMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MCBTYWx0ZWRfXwSoXJtcBw0DM
 lXMoVp0/z6iKcJ/bw0WwG+bdRc1bkujvHMBpNiTCKJvV22udxms/gLyAd9PCFbf/7/Ta9kG4IhU
 gGfrOvzzPEbGvPjfNe8RawSS4PT+3szukzf0jX0/mqbo5ZsqkhJG4MPHx/qVUX5ORunS6GzC/tC
 cl+n3xSq4gP9jC5DAoZNyh35BUZnRfjbs0QHKLcflG1q8oM9urQF2+qnrPwW0RX/6J735lNDFYb
 CtFTBBMSVJjh5oNFIoGwxPL1Ygw5q09Wt3vvuuKTsienUT2ruVTc7vnCXkOWHyrnwID1BHe7+Yp
 DMTQVRYAXAcWtkhLs6zGgSuHq7TocIR+xgEADjNrfsEX9KBnG2YpJYnXBiMZXPUNvM2SnSCPBDU
 mI6mULtNCUIRqyDdBPLQdAsG6dz+iLoBj+ZxCdLG7JjsAHI+IZoAhBRwgnL/AE6/iZUm5Z4inva
 g4Gy4wkFtyUTjuuzjMA==
X-Proofpoint-ORIG-GUID: OIyahzVQyHAt2gFdkDKEktBHh0Ftqd6h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MCBTYWx0ZWRfX/Rm/i7tNLZWO
 b3uLnS9T3gYgAcsLg2p9orPolIRo2ge6HjhwMPqdD5Q/gP3KvzJved2soWkwn5GfLTv23twOXNe
 bRP6G3pH9r57wivQkmKQY6TrAneKjzM=
X-Proofpoint-GUID: OIyahzVQyHAt2gFdkDKEktBHh0Ftqd6h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120040

Qualcomm SoundWire master ports are indexed from 1, with bit 0 of
port_mask reserved. Valid port numbers therefore range from 1 to
maxport.

Commit 6ccec91c3535 ("soundwire: qcom: Fix port exhaustion check in
stream_alloc_ports") changed the port exhaustion check from
pn > maxport to pn >= maxport which rejects the last valid port.

On RB3gen2 (QCS6490), two WSA883x speaker amplifiers are connected
to swr2, which has 8 ports. Each amplifier uses one port for playback
and another for voltage and current sensing. The right amplifier's
VISENSE port is mapped to master port 8, which is rejected by the new
check.

Since all ports in a SoundWire stream are allocated together during
hw_params, this causes the stream to fail with:

    qcom-soundwire 3250000.soundwire: All ports busy

The codec DMA backend then returns -EBUSY, preventing speaker playback.
Disabling VISENSE works around the issue but also disables speaker
protection.

The original fix addressed an exhaustion check that could never
trigger because find_first_zero_bit() returns maxport when all
searched bits are set. Include the reserved bit 0 in the search so
exhaustion returns maxport + 1 and restore the pn > maxport check.

Fixes: 6ccec91c3535 ("soundwire: qcom: Fix port exhaustion check in stream_alloc_ports")
Signed-off-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 6e0c5fb10efad..b4ce96792fa94 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1348,9 +1348,9 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 				if (m_port)
 					pn = m_port;
 				else
-					pn = find_first_zero_bit(port_mask, maxport);
+					pn = find_first_zero_bit(port_mask, maxport + 1);
 
-				if (pn >= maxport) {
+				if (pn > maxport) {
 					dev_err(ctrl->dev, "All ports busy\n");
 					return -EBUSY;
 				}

---
base-commit: 2e9eff8847a46530ab937696f340b9d5bea2e4ef
change-id: 20261012-wip-obbardc-soundwire-qcom-fix-port-off-by-one-47c0a8af1c5e

Best regards,
--  
Christopher Obbard

