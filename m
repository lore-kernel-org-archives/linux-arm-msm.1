Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE98339378
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 06:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786344702; cv=none; b=tLv3STpxfiNh77aaJ8fZIA2Ebry7uKG4L2KTFHMoFmdx6e55oak/gGpRU60bS2n/v40CoKBSulx0ruUEbC083s88beiL8KgnNFvGcbjeSSht9cLtobGJamQPVk33BEKrkNyWyYxAuwYJwIQQktjCzYX9qu11Zsxpr1YYDav608k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786344702; c=relaxed/simple;
	bh=RPOctzV+RKxb3xJXErTJc0vDALFcDOTB79vTZkKh2OQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mg1AeD7TOmlmgknVXy+0sUi80OGT0g4wBNQJzWd63LE1DrPHATTcXBP/1sD34LZ92+GqiQgdyi1XcY02aKY0pTV1kzJ9sEXPYFYOMeo6Izzl8h3Hbc5oEUXUUnYh2IesDPyj6dZqEv4kqwblWDdrZ4lXjRyXjEdmpMXamGICeIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAS8div1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W7b3GAwC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAS8div1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W7b3GAwC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5HfnI664647
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 06:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=p7xoezRWgP0BGhKK6+4vr9
	cVInLGyGVotTxlS+aj3SI=; b=hAS8div1NgbKKZI2vxJe62L1hM3idNwKL8yaK2
	9TBijRbQycXpMHJlfr4XjMmgiK/99vzA7QTwKbO8xWW+qKhxlyqdTiMUq/W3MtMi
	9IwLoJvxwvPCw7RLFM33Zv7sKik71kaS2CKJ/JWhNtrwP8pZh5yngU7O1Vg2rP6Z
	cv/7SnGn38Nq7NZbosqczilyXw6mc+hj1c3u6359qrMTBlJsQZSJ+2xZGhYoR13g
	bBlcaILZKPw8R1RwJ5QmSCLdhrId9R6Q5NSBr8EJPuXZki6AhoGzwq9YbNR/SaOM
	6i2LR/Xq4DdJgP9R7kFnNtFJMteyzUyLacf34dE2L9rNuYkg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvp1mq00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 06:51:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca8aee88725so2827454a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 23:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786344699; x=1786949499; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p7xoezRWgP0BGhKK6+4vr9cVInLGyGVotTxlS+aj3SI=;
        b=W7b3GAwCSzLdSxzXnCs7t0YBP8VsFilyl4wbwZiVKhGh9OmHx9XoJXo/ZKWiJSiJZR
         62KvojXmnfiBHADJZkjTXW9J3e90YmDuURL7fDueuXiGldHg+U5Awh5RmKFf2JGLqhac
         qzKFXl089+1bxe/IpuPPhiVUq0rDAMvbym7rBljWa1WAxybadf1+ZyGY1J7LwjnHo2BS
         4RLRlDymc3hAxcpQtNEbDKxTQuIPvXvQl/qF3kfOu3AXPxDoPJofJhg/eq4Bh87wAlv0
         duLL7qxQyWG3z1f0bgjLAs6qqhY6hoHIPF8rMlbGkPXDc5cn07Q+eAr34V1s+VEn17wD
         pEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786344699; x=1786949499;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p7xoezRWgP0BGhKK6+4vr9cVInLGyGVotTxlS+aj3SI=;
        b=FfzXWz9xnowIaXjm4QSJnfBF9COFVpkntdkoegmDRuUQZlpJh9TnJ8QiDZEtergTyC
         CIbpfhDZ6CaW3c7GrXZl9YlXfzMcfF1z2qqKFUF84V0m+ltQiOyOyRdCZgOvlJERxD+7
         5RtX0IUg156PGhye065Jac/uVv3ydsOB70Pv1hw4Nt+DGdeCOnNisq/qvzpw/ge2AnIb
         vFSGOFzN33TtPUnBDalkWuwaok9EsUdFxrgD1iZvwTn8gKhi+gSA7Va2ONvJYyBTP4W6
         yHaNqML4qmoGF8vdsgvN6V5KMpLH1m719S1EEkkoYLgskFRzsK3ba25L1OheiMNxRtym
         wqag==
X-Gm-Message-State: AOJu0YxLlfnkc9yoaRbtCybXfhvw2q+gspIZ0hGcDwkqPTQCDM+uhuhy
	GX5Ok6tpnN85llQom7o77c6vXoNHl/hy2ekdjrb+yJqF5rTwV3xtyvr2H5PDV2Eml/ZGhfD5sqK
	RVVZavEz+65oc4zo+JzBTaqgyA8/UcZM84xDEh5TAAKOX1oCLAM90txkSedkygZDrauEt
X-Gm-Gg: AR+sD129D4Ed/STx1URkduWWHLxEq3xU5PJNm4jX2AV6R3d9kky8uQEVgO021qXNRfA
	TC7v4r/lSIasjA57jv6Jd2K0sHaHOECfpS2uDIDfJfPHdoeKgoUGSVlDiRUOmA/lWDGiW+3S0y8
	Tvi5cj18psuT8rzSAknNpGcRSQe175iBbsrSeAPpf+9Bid4/ZFvNbKWx4aUsqc3cNOtVSdQD1Eq
	5BM6elSejUYavtOE2Ul2J+OFyQ94cLdTv3jSQ4oZpklwFl3b1GfE/ASiueOHYjCkt63ooWXZRww
	Adl4K/oaov2tChs6sJq9/i05VrcW21FOo1JGUsXD5R+3ECt0cWWfRlwidDGES4tEb40Nlv4AGpq
	xIc19Uit3NmlvLYbLHjTbeMe570Y1YW7ixxY=
X-Received: by 2002:a17:90b:2785:b0:37d:ee77:78ac with SMTP id 98e67ed59e1d1-3903c5e70c3mr40377917a91.19.1786344699374;
        Sun, 09 Aug 2026 23:51:39 -0700 (PDT)
X-Received: by 2002:a17:90b:2785:b0:37d:ee77:78ac with SMTP id 98e67ed59e1d1-3903c5e70c3mr40377883a91.19.1786344698936;
        Sun, 09 Aug 2026 23:51:38 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fa4fc7fsm11255959a91.0.2026.08.09.23.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 23:51:38 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 12:21:33 +0530
Subject: [PATCH v2] dmaengine: qcom: gpi: Fix channel cleanup in unwind
 path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-gpi_bug_fix-v2-1-60555394cbf9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPR0eWoC/yXM0QpAQBCF4VfRXNsaK5JXkWTW7BoXaBcpeXeLy
 +/U+S8I7IUD1MkFng8JsswROk3AjP3sWMkQDRp1iRXmyq3S0e46K6cipArZ5llBBcTH6jnOX61
 pf4edJjbbm4D7fgDVqgUebwAAAA==
X-Change-ID: 20260803-gpi_bug_fix-b0b80ef315b5
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786344696; l=2237;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=RPOctzV+RKxb3xJXErTJc0vDALFcDOTB79vTZkKh2OQ=;
 b=AcM1LNYDwHPqINhO1uOjL3UARNoNgbpIH3g3NFqhoSN4UCIQeSnBBeBiwNw1zWP/X6f9ecRsW
 9RcktteR6yaAkycn06ZRS0nlvitMmxqwaMqNH6oXXkQkOa986lZEXlR
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA1NyBTYWx0ZWRfX0vSaGp0A7KBx
 dzd3xeZDzppLJ9uaViDs45U5fVjQV2hx3RKl4NC08NrEDICCXkD/VYOQDNie8rpVtW75pBjeLPp
 rVTIZF4JQ781aTMTJJiW33BIMHpUCdVhNfJj50+93aMKosJ7XB1N7Zpcl6vWme1pxwWPsQURwBs
 oyJsixQ4KZVaq3tgLWs9o2Rl4Y5Q2qRYT4ZHWxFbA1/pVgYYT8LP3hdNupC4S15DNH0Wft3jCzU
 aYGzQUSQZfcQEDu8cz+Gkv5k/Si6URPJBQZJc2pkqomSmpYCcV/v029D45F8f8bNWuT8rEt4eNm
 hBXe3QSpU+q1/FwrdWGn2JCmozL3mnBiyGhrxjMHpYiuqMtd7um15YC2RCUlO8gCUDHZP0Mtma+
 7WGhH7QUbw/0bXcbMrLFuvNPbvEh6aaYCeI2nh/jLIoBTcLzKpF9Wu94pw/j2KS9pYoWkMzff96
 18AfsRAPdxD8EIEe7+Q==
X-Proofpoint-GUID: l8iRj8MuFBO-dZB_BgcmUjkJjBxcBOaK
X-Proofpoint-ORIG-GUID: l8iRj8MuFBO-dZB_BgcmUjkJjBxcBOaK
X-Authority-Analysis: v=2.4 cv=ebgNubEH c=1 sm=1 tr=0 ts=6a7974fc cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=OU4UCbDFA99cvMy684EA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA1NyBTYWx0ZWRfX5wRN2ioXPrN7
 yvEXfCFfKTYPl64QP/QbaZcwU2kT9D6Fu9rYtfAJZJMou8fnjdqrSGXRri64b911psYe5DuBbVr
 oynTc8a+wo5WUrrc8WmMrVDMGo6d8ww=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100057

The gpi_ch_init() error path has three bugs: sibling channels are
not fully reset and deallocated, the event ring pm_state is left
stale after being freed, and ch_ring leaks if gpi_ch_init() fails.

Fix the unwind loops in error_start_chan and error_alloc_chan to
iterate over gpii->gchan[i] instead of the original gchan pointer,
so each sibling channel is properly reset and deallocated.

Restore pm_state to DISABLE_STATE after freeing the event ring, so
gpi_free_chan_resources() does not attempt to free an already freed
ring or issue a redundant EV_CMD_DEALLOC.

Free ch_ring in gpi_alloc_chan_resources() if gpi_ch_init() fails,
since the ring is allocated before the call and would otherwise leak.

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
Changes in v2:
- Updated the commit message as per Mukesh suggestion.
---
 drivers/dma/qcom/gpi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index a5055a6273af..c41bfac65ddf 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -1965,16 +1965,19 @@ static int gpi_ch_init(struct gchan *gchan)
 error_start_chan:
 	for (i = i - 1; i >= 0; i--) {
 		gpi_stop_chan(&gpii->gchan[i]);
-		gpi_send_cmd(gpii, gchan, GPI_CH_CMD_RESET);
+		gpi_send_cmd(gpii, &gpii->gchan[i], GPI_CH_CMD_RESET);
 	}
 	i = 2;
 error_alloc_chan:
 	for (i = i - 1; i >= 0; i--)
-		gpi_reset_chan(gchan, GPI_CH_CMD_DE_ALLOC);
+		gpi_reset_chan(&gpii->gchan[i], GPI_CH_CMD_DE_ALLOC);
 error_alloc_ev_ring:
 	gpi_disable_interrupts(gpii);
 error_config_int:
 	gpi_free_ring(&gpii->ev_ring, gpii);
+	write_lock_irq(&gpii->pm_lock);
+	gpii->pm_state = DISABLE_STATE;
+	write_unlock_irq(&gpii->pm_lock);
 exit_gpi_init:
 	return ret;
 }
@@ -2065,6 +2068,8 @@ static int gpi_alloc_chan_resources(struct dma_chan *chan)
 		goto xfer_alloc_err;
 
 	ret = gpi_ch_init(gchan);
+	if (ret)
+		gpi_free_ring(&gchan->ch_ring, gpii);
 
 	mutex_unlock(&gpii->ctrl_lock);
 

---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260803-gpi_bug_fix-b0b80ef315b5

Best regards,
--  
Aniket Randive <aniket.randive@oss.qualcomm.com>

