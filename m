Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426694;
	b=SpLeyA5u/xdK2HmVi7YY0iN5mtxN6BUa7cssi0NZLv9njBg9pW+420wA9tAvWK0gL03X
	 QyNz/aktuCpIDHeFiQX58OsQluwb5Bod0eqAyvIRoiIFUWwXxMuTKHht6ZuaPtwl469ss
	 hoCLh5IHUab9Ni3jrvs2LOfiJJ/CblAY3exoJFspPmsBRRKk348GwhyUjGBhy3HdtZMJM
	 9eCRHwBrVhk2d1co1bZ8i+UKZwdLSu3h79Zk8SE+qa8OlzkcIbr+m21YVtFcTL34i/zwV
	 xbbT+C8jN/+MGZ9Fxnq5JxCmOnXBcmN3G+acGM7x9TLeQlbMeh4q1TKNRffy82DUvPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cdJPCWnGkorpLO32ktzbPWjsu9IZRJbbXQIGeOMqDBs=;
	b=ZsEjYlWsxcA5twWPYN3mXDQa3BebJthrgEdShSbRkZv1FOsokvZTjPJMvzje1esTuRBy
	 XgXsJ8KuNa6DAjN9+XcyGDDoC9p3GNlmoo2ovmJFwHoKXE7UAj6n0JSlYur3nEaATbf/t
	 aZI+oHP6VJs8nHq/Lm+GUXeaLJYHxUmbX56UFf+3z0JmmzZW8GFiu3AQ0svlpVU5YJFpD
	 ga51nCxlu7+zCOx29qpeDgiKOi1cUZZO8rb+RqHSaK1ZPDnRfKL0wAu2YFKUcySSNqBTo
	 hA2DRkzppEZt697DIa+2yIbHmKdOfhLBvytoiwie+bWcxFmdoYPv0cBxqV1YsaSFizA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NlghLLUF;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E14660A2615
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 16:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E14660A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NlghLLUF
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35c76e9614aso4427033eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426692; x=1793031492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cdJPCWnGkorpLO32ktzbPWjsu9IZRJbbXQIGeOMqDBs=;
        b=NlghLLUF2FbNboWwLud4VJ9BQloVK1P5Z2CdqbcQVhDho2r5kJ6nuKmYD2aZL9lSgs
         XUyzYjjjAJWcpCFbC2L7wWmGJ1bFk7fZtKpmansYVFVyVdjhcuxFTq6Crym1jiqGsQ9J
         FQBjTcuqfrizyKhzORa8P4iWbh9/Y7y/7IVE5ay/ZGzQri8bQfODzav9KGpIwmSlWGLR
         RyuVHwcQKGhVzV5SQ61QFz7pE8CfLm2JeaT8beVGh6vi6F2qSlanO2cXcbAOFYavlFT4
         bz32NgQe6uyP+9PGDwiSYq0APKnYZsxSvyKkH0fE8hwEJg7LgbQD8CANBFqDMHZFpSgd
         Mm3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426692; x=1793031492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cdJPCWnGkorpLO32ktzbPWjsu9IZRJbbXQIGeOMqDBs=;
        b=KTDevx+ymWzStt25PlzmcTAR55gScX2OJzkwOq92slZRea9vDn+XWkbksuOsJXTYh5
         NI87rUOqi0cVSn7Hq8/3kT873yiaz/dGh7DpvpTL8HLybXh7NZAMZh5Zibe94CwjnsGc
         Xp6DKGctXG9kUENmJL6QOqkZUCoxTZseWgpr150WwJo+2zItAKUFHTsDSp9IWQDu8GBt
         99A1L0khgWDMTtFDJ3A+8voN7iqhR+Yk7su0KKduz5Ayw9q+NFtU9odVc/KVhwMSolsc
         PNtfXDAvJz7lJYxzW0a4hGjavF1CXsd4z/TI2f5IT508iWNDK6dgvCT5mLNum4M3C9+g
         sBDg==
X-Forwarded-Encrypted: i=1; AKwUvBy6U2jrw/bNQulHSnzLYtZtCwTXc5MMsk8IE5mn76hMavfkwbIpoNWZB97q6hsO3BbAuNp50yklgGfRtlAT@vger.kernel.org
X-Gm-Message-State: AFq9FYIMZ+hVRpAan5Izg6UR7FM1ybTd5qrmmaP7YS0zEmRil2dhCCj2
	h2vHfT1GdOp2wJ9Gpm7fa9jyJlYpZLGufouXFJC81EOKPtzAB6FkjxYt
X-Gm-Gg: AYBFou2SesBO9w7FFRF63WMpex2oZNtvqi38sk4XfMM6o5ftOK/mvgpFATBHEDQYGvH
	VpXv3lvN2rIxBsuHcayXsMGI/1Cr4q/AbV4v7yheDvN6ppHJh2q1wNwYt6TFZVD/sjDtUNRVrAv
	nyF1n/Imbu4paSi5QVmJhKZ0sPfK0aLIM0O9KUTy/DaCobBviQswpAcFHNPxu0fo3DWx7XbbR60
	1xWxSRw14q+2xZs9gjeKw7nqELnlUAy8V8boS+NY/59gHWjT+oPoDwcvUay08Pihq1FO9EkTLbm
	DPO2k+bQo7coVoDQD310iQXTl/NVIOR763Q46iokq65TW+YQuHVNXKbHqADALSDGZnsw8NiKa6C
	33XfpuERnFd5qZW6sCRdcRbwneNgB/rwSgRoG8HX4eDrGvAQ8QrqXmgNbLkypYKe+DAkh1LmG71
	lGScBo33/tiMsqRr4NQwpS0EOsxE1O0LRkLLeroSMHwtTx6LlsUt0nXvAEvGHbSVDf2mqOySPAC
	FD95iZdRGUqqsyv0amA3A==
X-Received: by 2002:a05:7301:4305:b0:35f:227b:f8bc with SMTP id 5a478bee46e88-361a1465355mr10294813eec.11.1792426692027;
        Mon, 19 Oct 2026 09:18:12 -0700 (PDT)
Received: from redducc.localdomain ([183.83.156.125])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082b8573dsm33412914eec.25.2026.10.19.09.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:18:11 -0700 (PDT)
From: redducc <sushmit718@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: qcom: q6apm: Fix the wait for SHARED_MEM_UNMAP_REGIONS
Date: Mon, 19 Oct 2026 16:18:05 +0000
Message-ID: <20261019161805.2427-1-sushmit718@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The DSP acknowledges APM_CMD_SHARED_MEM_UNMAP_REGIONS with a
GPR_BASIC_RSP_RESULT packet. apm_callback() stores the packet opcode,
GPR_BASIC_RSP_RESULT, as the result opcode, but
audioreach_send_cmd_sync() waits for the result opcode to match the
command, APM_CMD_SHARED_MEM_UNMAP_REGIONS. The wait never completes,
so every unmap blocks for the full 5 s timeout and logs
"CMD timeout".

Store the opcode of the command being acknowledged, as the other
GPR_BASIC_RSP_RESULT cases already do.

Fixes: 8ea6e25c8536 ("ASoC: qcom: q6apm: Add support for early buffer mapping on DSP")
Assisted-by: LLM
Signed-off-by: redducc <sushmit718@gmail.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index b6b1ef6833b3..379b15b7e503 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -960,7 +960,7 @@ static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 			wake_up(&apm->wait);
 			break;
 		case APM_CMD_SHARED_MEM_UNMAP_REGIONS:
-			apm->result.opcode = hdr->opcode;
+			apm->result.opcode = result->opcode;
 			apm->result.status = 0;
 			rsp = data->payload;
 

base-commit: 6a56f4f29711dd2da49f03a5b99ce53779e638d7
prerequisite-patch-id: 154550924ab1d2c1bc95517c058aaee0bb242f92
prerequisite-patch-id: 22bca48e48813fb55976db043f9c35c926c61e3d
prerequisite-patch-id: cd21b1ff6a4fef14c706cea97fc906d7a0331b5c
prerequisite-patch-id: ce4057205dd2c2a6650c3a36c60664bd2737e202
-- 
2.43.0

