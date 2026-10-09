Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9597746D08C
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 06:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529149; cv=none; b=FERGFaF89gd1hT/PE4GB5hIY4y65CSrRgTKTrKzwxbClCu8iRGNIIgbNWLPBxUr/2TB2WP72pzpKiCo0SH8H95OiNji6LwOYyQg4WGZJdbuxib9DxrkyWwBIW1XZk1KfJnSqnxGsHRelj/XKtJp3tXDcUjX1Du+c8tku6IbSGV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529149; c=relaxed/simple;
	bh=740EkIGFZtFIXwYOX/iewEqW3Uzy8o9ydQxfuh2xxMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TLpEMPCWg9mJUFl6zNdapSucvvQcMPgMqzjdSMWZAqrgorx1CQT1Of4VNz+zf1Z2HSHzwO9qLQUCDlbnHUY1GwzjdcFwq3Q/qgMgxMaNbUChVHv2QJmVQ5GvksENYkryk9s/y9LfRfdPPaxV858beBaBLLMGeozpY//CPh0ob9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iKoy//46; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ha998gom; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iKoy//46";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ha998gom"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993H8Sj1597937
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 06:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rg53SURgtoK6JRpYRBLKGLmSwEuO65piE029ZGCrJmo=; b=iKoy//46HexBGtp2
	1iKcqPb0vE2I8uePN6WgJJbq92Gg2KKCSMJnJLeqYJVfcqKwADnar7a4CSloI8mt
	GoNBlPcNve9iU1xk1NsmSigmZzSC1ZpCv1BUJaiSzFLHF5tIYZQiaVmnarU5mQyk
	Sr8WPhlvDn9h5xW234Hajfze7m9+F8n32Qy23QE9/xjftL1J+FgLigUI1USMJo7k
	KR1HVx7Y9cZlA6YHjOENYvI1hoNdo+YE9iBVVe4/mESnmEkzPY779k8RDnRaZyIj
	MOhSBggozJu0v9CNpZVa6GWPllAFy/KZNtgGWASGDQLgeXdqyF4aukdGLhUDonoF
	sDY1bA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6nufs4ur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 06:59:07 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7e6720b31so4126249a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 23:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791529147; x=1792133947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rg53SURgtoK6JRpYRBLKGLmSwEuO65piE029ZGCrJmo=;
        b=Ha998gomganFo6UpK9ZaD9GsRMR9LJHToymEqNQqezdFOy29E3kSloCWTb2cybys8t
         Uvmv1ZIQUBHlNYBxaKzR0YG/DDvzZweYUrAF9UZbwVb/QoQzPz2ofW1L3wnjWFw82aH2
         thiizoAscqmOZyvQaGL/2rIJ2vOWf4m2ra8mK6bFD5avVfi0W/wjX4Huyffy3nmVIKRR
         pWtOIpdGGFZCHro+jLrA26LIFP+V73mZlawHCQ2C1aAt5fAdOUywxkusuV7fa728y4xb
         xFCOTiFALB0rE3ifYeHmqid74dhzraTeIig13egG/7pLXtr58UZ4YGH7TB/RMe6EFuGw
         mPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529147; x=1792133947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rg53SURgtoK6JRpYRBLKGLmSwEuO65piE029ZGCrJmo=;
        b=WHlvliq77rnv7MqfdPN8W2q70XKQebcmzQEn9VSj5bO8EGksRVEvsqpacu9bsY8sVR
         E8HmmUhKJdb9MNPCcEOzglT+yWEkbiufhWaNYxt/c3ilyfrzJPzfzj/Y4qOlLA1J+p7I
         mRMkCa1JhVjzE7PHv/vrbkrFjlUZJHMCb7mSoZVNpFMZZXvrpZwHyCH1kqAoPxnk6e/w
         nZCiaxINaMPz+FkgTL6uZx1Io5yxhiVVekr24fyB85pwfnUvBAtzHd1G0F1ZTq6+5CqL
         J/x4zGngzhexdfAD9qQuPWTqFN2K1ntX0eO7VfYb6c6ZrrjaWyAVaZqZrELqureQtSj8
         BmjQ==
X-Gm-Message-State: AFuF++miJRkREYNRw7TYyWyjDFVTFoNE3MKWqqpCospqDA+jejC63y/p
	3FRWoPZaDoiq5tRQ7G7bnC4vwOsNvzmgpq37BSng3X51TPzSVhj6ue5qerf4Hl1lfbEUYn4g6ou
	umI0GVkPx4yR1gBTNJ5j7PxIL/8pfrnm+jWF1thT64van1giiAci9wKp3WlZ73eKyIuwM
X-Gm-Gg: AYBFou07tIuIjeq7DBjPIfeSO8i/B7Xi2t0MIrSDToeObODUVpBYbbyUgOrf8ZMonh3
	0/SSvRH5G6J6ozlnP/SXLoub4phiMZgNsJ7OzlokqrYZHMgXHLF/78MEaReBow7d01Lxyrrt5z5
	eP+tQZBwE+jd0swZj2OaNGf/7EWr7FlAJboOTRHvpUr3vvThKjuToDELUGW9DS2Y0gMjX7toXRs
	MDc2zgvkO6qa9ehB4haRnM2pmSuBzhVScOCjrEuCZWLMci5wjPmYuI6H+L9P2pphsVpv7JONblx
	y6wr9pXdWwV/LjjjY8ozQR3SHONqK9DwjjpV4MYcyRbJNE5SQvmSei88Y3qWjgEeotKY3P1XGAC
	0Vni0r03s3B7R4HtGqy9h
X-Received: by 2002:a05:6a20:b78a:b0:3de:8825:15b with SMTP id adf61e73a8af0-3e16be899c6mr792891637.12.1791529147185;
        Thu, 08 Oct 2026 23:59:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:b78a:b0:3de:8825:15b with SMTP id adf61e73a8af0-3e16be899c6mr792875637.12.1791529146734;
        Thu, 08 Oct 2026 23:59:06 -0700 (PDT)
Received: from [10.213.103.163] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e088efsm499980a12.11.2026.10.08.23.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 23:59:06 -0700 (PDT)
From: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 12:27:55 +0530
Subject: [PATCH 3/4] dmaengine: qcom: gpi: Ignore cancelled
 transfer-completion events
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-add-gpi-dma-support-for-uart-v1-3-c69e728df686@oss.qualcomm.com>
References: <20261009-add-gpi-dma-support-for-uart-v1-0-c69e728df686@oss.qualcomm.com>
In-Reply-To: <20261009-add-gpi-dma-support-for-uart-v1-0-c69e728df686@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Aniket Randive <aniket.randive@oss.qualcomm.com>,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        praveen.talari@oss.qualcomm.com,
        Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791529122; l=1661;
 i=naresh.maramaina@oss.qualcomm.com; s=20260316; h=from:subject:message-id;
 bh=740EkIGFZtFIXwYOX/iewEqW3Uzy8o9ydQxfuh2xxMU=;
 b=JqFaAmdawq6smUdcDFsbAX+5HGxhGoVKi4ouF8OYvKbfYELPkjWaal/OGgMePqHatl6lXw1qT
 xqSQzbgPP8kBfk/2+UnVRAXuDFy3y9hEZY4sTESghXqDRwpafTkb2XY
X-Developer-Key: i=naresh.maramaina@oss.qualcomm.com; a=ed25519;
 pk=j7iST9yrLbsgWcWrqdlUNIOWl2WBl4wV1q35/n9SCkg=
X-Authority-Analysis: v=2.4 cv=afn0Dhot c=1 sm=1 tr=0 ts=6ac890bb cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=nTkR-nbgk91awTfXo10A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyNyBTYWx0ZWRfX9JMOIgwzHB4S
 ZGHoTnb7muK7HfMsIDT50fGxlrgXHGPXojmudEShgkiIrHg8M/pYh6R79QsSy3PXCpq61X5bS/5
 sW45z95v7o41f22/BfPXPwI+Ln5EO0E=
X-Proofpoint-GUID: On8hB_oaKZFSEh7wluDQlQ1dynEaLyVk
X-Proofpoint-ORIG-GUID: On8hB_oaKZFSEh7wluDQlQ1dynEaLyVk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyNyBTYWx0ZWRfXz9pcmlsHqyj9
 rjSKjt8uG3yPOw0J9SKG4AYQ/h2zYg2/U7FrrErdPTNHLtNLJsZFDin28yT7QAip3A4jzQqpI8R
 ik1TLNbK2G7fO7zQAwNY/2+zTC0mS2yqkuAbWlnz1SsTuNBhBbfkZmn+8VQ1yjvWk+R9dst/N/1
 EeEP2Gkg6PcYutb5lq2bSp+QqQkj7TfkH3nD3aiMmNW5AuJZ0BD0PQ4w0D5efrZo1wtqCUMWuOj
 DKJSU9nDBmn+pnPKFibmpED+oE1cvvvfQSz1QZfm4JfBtfwGdBR1EDFyekWfm4UxFjVn2k1IHKF
 RWC81iPS/9yMm53DwuKFVWCtNPO8SwWH4IDIS1KSqXFxBczpmT7va4nE9rbLzpJMOwLZb31AlnN
 vuP9asLA0Fm+kkOObUH/NgxPtLz5RrPpJbfO0BqW4PdG/rOKiNH96QVQnki19MjdOGFfscEGHvk
 xc/aXqiG91CKhXqv6yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090027

Channel cancellation can generate a transfer-completion event marked
with the cancellation status bit. If the event is processed after
the channel has left ACTIVE_STATE, it triggers a false error report.

Ignore transfer-completion events marked as cancellation events when
the channel is no longer active. Continue to report all other
unexpected completion events received on inactive channels.

Signed-off-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
---
 drivers/dma/qcom/gpi.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index f72b80bf5553..7e1fa8d24902 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -22,6 +22,8 @@
 #define TRE_TYPE_GO		0x20
 #define TRE_TYPE_CONFIG0	0x22
 
+#define GPI_COMPL_STATUS_CANCELLED	BIT(14)
+
 /* TRE flags */
 #define TRE_FLAGS_CHAIN		BIT(0)
 #define TRE_FLAGS_IEOB		BIT(8)
@@ -1022,7 +1024,15 @@ static void gpi_process_xfer_compl_event(struct gchan *gchan,
 
 	/* only process events on active channel */
 	if (unlikely(gchan->pm_state != ACTIVE_STATE)) {
-		dev_err(gpii->gpi_dev->dev, "skipping processing event because ch @ %s state\n",
+		/*
+		 * A channel cancel may generate a transfer-completion event after
+		 * the channel has left ACTIVE_STATE. Ignore such events to avoid
+		 * reporting a spurious error.
+		 */
+		if (compl_event->status & GPI_COMPL_STATUS_CANCELLED)
+			return;
+
+		dev_err(gpii->gpi_dev->dev, "skipping processing xfer completion event because ch @ %s state\n",
 			TO_GPI_PM_STR(gchan->pm_state));
 		return;
 	}

-- 
2.34.1

