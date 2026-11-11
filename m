Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384398;
	b=jybA+r3iFH45qp9lJTJ5u4dwkxWt9/kFucTKbSWNcERJbygxjGTynZInaKgzyEKVJL6B
	 in7Fsw7Df7c7u9f5y7dHWh7W5GH8UTRxW3TXTNBmHGzVbLdjhbfMa5l9pWHi3nZKA6V8g
	 sZfWy7z+nSyxgthTng6svaN7QJ1lAyRjH4yHblRRhpQK1hpQ8mIDK0Fn42jiZpZSAAS3U
	 r3Dm9ALA1qI4xYYjUawFXijYrtEEw5zoOYKoO7CxEu/nwc5/GSGrJT4ppUACscLQPmCo1
	 WuJp4zwy464LVwKi/bIZFi80HRDOsAF3VofZYBdkLfhwASmbx9GEwrx08iP50b8zw4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/Vw/Ng9DVAcAXNdpYFohPWP/a42h4elI1qUZ0Yy3RdI=;
	b=amk9tFKAg0wH3vatM9N6u9KNCWQJamixQxjAlrT495WMaZe6sRDAjWRyLbarIBVGJceh
	 EVxGx+lG9VGAii3HWtYJWycY5vzLac+Vf8vrAQSA3INOvaFFYRt7+BPM8wC0x8fUNPTju
	 h3iUZn+Uc9U6ITZ+Tr3cLRD9U5FY1c333S4KITtq2aUs+mnd1l9uIcfuRdjRVvCsTFFYh
	 3G4joCCRwxe8QzlNmKccG2OaQU0tr6ABoSrPgDq8wR6h9JS2YqhKl8ms29eH+MiiYB46W
	 MGKkVqeskJwX7+L67Q5wiCIIVC02HExpTmJ8fNa0ioIDxANmv1c72tgwleRLzWGzPWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=gacpxWE9;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B961B60A6F66
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B961B60A6F66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=gacpxWE9
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b7245ab5e2so4187093a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 00:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384396; x=1794989196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Vw/Ng9DVAcAXNdpYFohPWP/a42h4elI1qUZ0Yy3RdI=;
        b=gacpxWE9WxZOwiWnKoLF6LJ7DhjMhXDCXTqv4CdbCFctA7Tg2HZucpZPc/vwNZv9jR
         FSZYkFWf32Zf3DqADqJQh1r/wnr+UsrgAyo+TZy9IBM73JImieNt2dtqHX8KA5RM2adD
         3uEIVIV5VNfdGoYx/oBkMJVoC3SJOCpdjk/5f64xjSa4vm3qssEed2ROGcAgNIAll3TB
         5cyCpqtgQNsQPFR6QXBSXJhoEeee0YFFHEMH9QATMdPgr+OZSTzX51FqG1YKfBZ7zuKR
         75BknnVTz+CIPLaweKs5YCQo7x3mPnfe0cY+h4CNJcrC4CJB3y/0rWNXQIjSbTy5DfWx
         4QTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384396; x=1794989196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Vw/Ng9DVAcAXNdpYFohPWP/a42h4elI1qUZ0Yy3RdI=;
        b=vtwZeHwa9epYK5UppakrsSQ/UsU0IERZD/NZuojrc9onaZNLsL9QEgoTBxqrQGji86
         KN9Mlo7TooJEVT8ZjjmV7lWMPVJl9E3ODefeWCzEAsKEDa3I8lSKnHN91r/PwzJT0Y2F
         gh6TSoKhH/jX9eByc+/RU8kItC126BsjPBYAoJNxS02B5FqVpDmVncR8zXAd3RAh8i+x
         yDEYL7/qSYg6f9qzzl1f7sazMUriOCPwH0MJj1S0LGvY6dO7m00/r9QanRgBfNiauF2C
         E+rCEViX+ZzssbzjO9BxlBTiFLEuS3XZwFjsQeHCJpRZtE6hM0K48s6AzaUz040N3Fj5
         +yWg==
X-Forwarded-Encrypted: i=1; AL+hErH9Rihrd3cmE0oNqE5s7gZ5bobjE/VLJz8HtQldrdUSgS8ZnKmCZytromcmDaRj229agVKiUTMQu6p4n/wB@vger.kernel.org
X-Gm-Message-State: APuU4Z9obpfIIfQmvpLz2jeZL47StoG0kI0L27PsYeprGR3/8Bt00+ML
	7CVIJQ+RH6HXB4THLj6/ViXzxZiF+PwG4fgbDppbuZu/w+H/5Q+Rcenwq3t0OEraGA==
X-Gm-Gg: AYBFou1WNtD0oN29wKk16AhYOcfdtgwwJvBO2k1sv72exdE2n88z1MZxolaObTXN7+j
	k3ZBk5ZwzdkpVtp1TBcTz8gYvXg9M1mee8fiymcKndOrtLvLMLyAzOlQqBirF+ZkcPyIccEJGDL
	3EqseyrLsn17gKHWCTvVLLX9BLRCdrx3UtIi5kbKX7cy48BfUlkrmB1j7FvIKLa+LQwtPB2gafM
	Q4fOmeAY4Ob+BsP7h8VMDnnmgrjRF9R7nV2sHvB4Wy68Y73dTZU4ARbt0DKzLKSNi3arB4LD96c
	06MFYBDUX+N0bDUC9Kw5nPdqb1a6d1S++Qc0crCdpXc1U1iukzdceK+i0fvml1GrQ5uJVMbRqb3
	0XfVZU8saDxyC96SGXVklKlkv41vFksKHNjvQnn/Pa8FeRb+Q3mYdqSSoM+uEImHx8UPAq8R4XA
	xcGgKfxe5RtG5nHkQyWhOzjGbctgKeyDrlcRZKIg+LGejQz/dzu+b8ILg+ZobpamoT4PhNENx8k
	bI9Mo2IxsA1exHaLUu0VWbhsUOaK6d8Trx7NYWW/2pe/gQPKbB9h0Ry+Djzi+bLrJO4fPoaSLGE
	1J1Z/WBncWz64hXLgk9X48rOlvHxXR4Ao3vZ5PV5CqHx/Isqxl3X/0Z+u4Tp4/x6vR+McKL3IYb
	V7bv4lXldrl3bQLP2nSGAM2bWmdy0JB6IUUNRpdPch/zROrc6SXHtX5yPGpnNQqQDDyUe2s+eoS
	kQtab65LSUGzeyDeWE78f0ghc/7K7ybvHQpRsn+8SXMvrNKCT8WekJaGeEr3VIbFP2cnPqgwLfT
	MpGl/UB3iUgmL6USpXRm6vDkmH5HBkct3a2H+64eLiGnmHqgfdWc+k0gUOEnkrwe/G+LMwkw5HP
	D6dOgQleRqD7AbNEjWBkd9eL/sKwXY9GLpFrV7Y6
X-Received: by 2002:a17:907:d311:b0:c25:f7db:4bec with SMTP id a640c23a62f3a-c5066b54812mr120674466b.18.1794384396170;
        Wed, 11 Nov 2026 00:06:36 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6af519sm203722266b.87.2026.11.11.00.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:35 -0800 (PST)
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
Subject: [PATCH 3/3] wifi: ath12k: ignore WLFW servers on the local node
Date: Wed, 11 Nov 2026 09:06:30 +0100
Message-ID: <20261111080630.244427-4-julius@bairaktaris.de>
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
ath12k_qmi_ops_new_server() connects to every server the lookup reports
and starts the QMI handshake with it, so that process takes the place of
the firmware, including the REQUEST_MEM indication whose handler frees
the DMA memory that the running firmware writes into.

The WLFW service is provided by the firmware on a remote QRTR node.
Ignore servers on the local node.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 817bd820623d2..ca1d8720a4830 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -3994,6 +3994,10 @@ static int ath12k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
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

