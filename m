Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384397;
	b=EZcCj+nkDldV81xFPFwNwE1SD3TYykJ4FmrSrsqATGAr+G3a1Hr6ewzb9SOWdumpLxcS
	 C3OuTAIGynw97SrSwGAeYtpLLxDipl6FU6tyIxfEDGs35SsZ08wiz0S8W25xyIigApDaq
	 R5+jd90YGVSXD/FtaGamCQKmTHOYqoRzEcJKf6XXWXKzQl4lSio4hL+Ea5a+tDNUSdGc5
	 W81VAmTrVh5k4BtDj1NmMZQY86CWBYsI82PbMoipC8YoXQ3Dtv0hPNIbVldt89dnuZw1c
	 tqHJeRR9gSodHsbSsaAgAVChtKqDLF7b2hbm4bc0h8SF+o1LQwup12RF4DY6xVJHVUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bUvokNlCeYm9onJ5oM1T8ZQNs1QR3modjs0guNDfzJk=;
	b=1S735DV/8Hs0eroy7mnu8F1a0hdFsAH+u9wH5Zq2/kdy/P/cGE/EUdShqHcreSmTdITb
	 U2TJNG55s7UtZxzDx7hv2JgH7aC+VPJNu/FGreDzQcHh/1gDJoxdw+chBipqBstb5tX/c
	 AF+vPnh45KQBf/WfddJYt924KZYhMkkrKm45aue8sdpTogHoWBeSV+y9c+Ln+xjtTHTXw
	 H6BS8R00WrJ6cP5iEHZE3P+BMlyYbXoukhjl5RIloGWwj4UMPXeE+SrQn8JtQCpPDmIPu
	 QqZxQNRkfh/bggvH0tKG/RgwNKquiC41IIoRU5mHjfB0vGthQ8mTFT+Gbomell046NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=G9XYGNiZ;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F265560A6F48
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F265560A6F48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=G9XYGNiZ
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso6358632a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 00:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384395; x=1794989195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bUvokNlCeYm9onJ5oM1T8ZQNs1QR3modjs0guNDfzJk=;
        b=G9XYGNiZqL7cP7CR4fV/TQ3pohy/Mat/Y9YA8/O2Z8asWXdeIX3vT7ODOi6hC2FWMW
         pIeaTOcKTAFnUcfKMb3vNASe8zwXsdnpMrAfvroi74/OAgUpnbDspnE0gMnnPhtGL5Rv
         9JvTMJSsmfka7eHEjfqwsir2jxglkoL6LaNkqoS+tMuC3dupzZvpLpg8lbz2WP+dMgts
         q8RZUdfOJh34+AGFdIsC49BreKaYo/VYt7r4kiaSP/wP9ObAu0fe1HuQcjqFVjA4KJRZ
         DWsob8vj+S9jQvoiDFBmVmHFvd7TYqgX/hmMpr39ksaHwy+nTOFtzrrQ0mOvQ0mFYUhB
         zPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384395; x=1794989195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bUvokNlCeYm9onJ5oM1T8ZQNs1QR3modjs0guNDfzJk=;
        b=bukZ0by+Q3eimJPLPRMsA5CyMKjjzHL56V4HWjJk9FSy/FYs0kOyTxnn93gCdNJIPU
         eh9ptlxtHooWi6KNi5uWJJg1lMqxUtwI+1HXnBKfXIQm6b6YlM+QZlf3jbWQ1e2b5pK7
         6/nT1y8A4gQSPVsM/5p1v3aZrgX192XoQLWE5F+aGQDH4O+l/DuOlU221EMWpeFkCDsX
         n/koNz47wOzNzH5zq1CNECfNkCjlgF0rFELfRJ6A3HXZg4dCOOIV4vWqJlqMxIkaVqbj
         eHjnE19+43Ejofojmg5rz4LGWamMYwGW3bjy8O0QweGoGrS/tNzbUqqH1lZB/vYK0qD+
         1nWw==
X-Forwarded-Encrypted: i=1; AL+hErFn+FNwayuhxBLBAXoVhtDySN6MiSewfjsJGBMro9TkhEPEDp/lZau5L+uodukRn31L+KEz+4akr0SrxONd@vger.kernel.org
X-Gm-Message-State: APuU4Z/JCCCGYj0odvpgF4s4CVkvtB7EyZpKxz72LWvomzWoEoYREVsE
	efRWNaHxDI8gn65azyvzZAfD5lcIqW60eBayAJyK7k5stiYWUoYWFE/DTDIXd5Pb+w==
X-Gm-Gg: AYBFou1dISBfz9q2q1BCI8iIKvLdiV2fm993MhAehUf++o6iAdXrWmKib+fSHU+JorF
	lCHtBcbof+rlpCEQ+oo8+R3BRWJCHjITWtQzji+3hwV3AiivY0zSckrAZkP3GqNtWSniHLSA2zw
	N7Uqc4808IwfAhJNRvI8OyaSKlJnuFBu6TOfazRrkDBMvprx8C3yYGEFHIiBZzUrqU1G4aWRPPi
	ENGG7U8H8d5Fjgg77IOyf/Pq9/mSUgp56fMqUBOeYe0E+Ic7IJDYpey+LDvrTI4PY+2lMrqv3Eg
	s01YEUhX9rKjGEaApgEPdN+JqJdmIwS0CCPkzaNvcP5azgFzlYlw6ksMQiLHcQ6PvClbSrGpBCc
	Jd5YwxwihiHkPorZatbDaKNJbNUiYWdxk6YtsFlWyR+3mdVPjgT1gkmVpE+ByVXFenCpQilXV4z
	IZ2ov5pxFD8ge4RDzhPSCbWZryfyqDUlUzs0h0GFWqaegtQl+cJz+PwYJ1A1zMwIHXw2oiHMin/
	tqFSkx6rpFufs4f/ihkUwxNQLxH3AcnB1U+XKAoWgpWjM+Io4zO8Aca54rtJwuZzFiVGfcC9JMG
	ugvU+E5ekqxXGxnHEtNIEYNJbPYhB8BiFQF0MKLttWa615NyPNZ/yLs8p6cuf845kIaMjxKWDaJ
	6Ximey0wfz8T/ZY8K7g6w8fF0k9CTLFxDqCt4n8uwzllV1IWuEs4NSBHfJH1dKMe5KbOBeFlZ9J
	uf7gjDpPXLWpOtyXk3MRBaDF89uBRrqK4mXDBaJI0vnYEBpbGYpEPuxJQQGaNvTK9ZxouLKEI4J
	JNb6bqyHqdX/Y+a6uiiRCGJVl9zenwrg8u5+x5JYo7xq9SNPZL4rLiPCYCB4FIudj7b8IBLzu87
	ArHGbdyIuoErdXxBLcE=
X-Received: by 2002:a17:907:3d0e:b0:c49:d1c5:431a with SMTP id a640c23a62f3a-c5066d58e34mr133683366b.38.1794384395369;
        Wed, 11 Nov 2026 00:06:35 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6af519sm203722266b.87.2026.11.11.00.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:34 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Chris Lew <christopher.lew@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] wifi: ath11k: ignore WLFW servers on the local node
Date: Wed, 11 Nov 2026 09:06:29 +0100
Message-ID: <20261111080630.244427-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111080630.244427-1-julius@bairaktaris.de>
References: <20261111080630.244427-1-julius@bairaktaris.de>
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

Any local process can publish a server for the WLFW service through the
QRTR name service, which records it on the local node.
ath11k_qmi_ops_new_server() connects to every server the lookup reports
and starts the QMI handshake with it, so that process takes the place of
the firmware, including the REQUEST_MEM indication whose handler frees
the DMA memory that the running firmware writes into.

The WLFW service is provided by the firmware on a remote QRTR node.
Ignore servers on the local node.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 7dc07339b9579..c4e4b9c5ec0da 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3172,6 +3172,10 @@ static int ath11k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
 	struct sockaddr_qrtr *sq = &qmi->sq;
 	int ret;
 
+	/* WLFW is served by the firmware, never by the local node */
+	if (service->node == qmi_hdl->sq.sq_node)
+		return -EINVAL;
+
 	sq->sq_family = AF_QIPCRTR;
 	sq->sq_node = service->node;
 	sq->sq_port = service->port;
-- 
2.53.0

