Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205493;
	b=O48jHf0gqOwl1nwIlJ/xCNunEIgKh0CdaXqH2byna9HGKtGNBhK1XIgwtq0YQpiBMOJb
	 nYoKMQAghm+QCo6aGha5JmDtaz0qVCvpkLQ+3RycmbXrbmp2p+UI4z/2osouBmAQWrk3E
	 b3gajCgh4740NI/qXiB+HknExiS+HsNWL1sWSB0pUPlWdH2YNSc3ihW5s0EDWB6wzofO6
	 h2TGbuPeHOWSaCw5PyZS7JXIXUXU3k5HE6OwaJNwHWVbFM4D/u+07d1FVQ6J8cTmPwdbP
	 FxGLY96B5iJDhS4Ytu6pvwsUWr56DZ3+iZXjblyCrEA2HTHo1EA80LZlmuJitX9wzRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VSNciQwXoLzNC38H4Cu8pkuiuhLtNiZHzowcIJLxJLQ=;
	b=IhiEvTh8vhfl7upBOx9qigX+KSGQSSEr7boX3KHV2m+Fq+zFaM7nkOjDoQPapSOoLgWm
	 k6OD0bMDHWsaRGQxHxI0DbtRuenQOZKsBSuq2UmddeEiMZKYoP746+RRa6ju49DmzcYcH
	 iTS3BJMe/SuUyjx02b7hBI85NRU2ytxl5FV3gMrV56Lo1aTqFg5KuJuTm7C6cGWoQCl6h
	 mN1b4BzDkgysylmQ/oupJ1OHfvYy6ZF8RfgHNOB3Yi25V58nS+Xne7ySNMUetnCKVob26
	 FsKaJ25cdM4cwdQ+Qe5xB8afyoQ3zuc8L3/QL8Co/g+XLE+PPjVoi1kcPe26w9i3MBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=caX+YDDx;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68954606A333
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 20:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68954606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=caX+YDDx
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso11018065e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 12:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205488; x=1795810288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSNciQwXoLzNC38H4Cu8pkuiuhLtNiZHzowcIJLxJLQ=;
        b=caX+YDDxbdK7lOatziDlxo1NbeN67mglyVy5oETr/Bg/CVDK8WbHmhkGJNrTaJhyfq
         L658wKUIOvvPgzjTnQdWj+gQkuJ/fWwmQwTEpocdjJ9bNQZEZ0iN1E/eHLd9+d1FD3kC
         4p9jeJo1Xjwh/wB52phrpgqgm+3c6cs39cBZeknpGHCebRd9+sZD9NrG9r16Eri8jIz9
         wDb6UpfFg7J7mYFjUV/VcuzGYD9hLMgTh46e9R9l3TWnjc/UAWnfb7E8EJ+b1IbdHqu6
         Jvl/ly1YZVOYNnY6KXYPTbcsxoOz8VIP7GNuOeKkaocpO93yfSEUXzaYBZbjWJXLJVOt
         ScMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205488; x=1795810288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VSNciQwXoLzNC38H4Cu8pkuiuhLtNiZHzowcIJLxJLQ=;
        b=VQ6lgOHWmr5rr+Twdqbk9TQ2hodNufLcvZgKik3v7kSwwUUlzIGqR4o+IwsdYo7aR8
         njSQ6brfx4hy1W4lYpBy8LQ0fslrQWCPUVUBJH3/CJ503vXhSrwDHDikmlGcIWlJrfVu
         93Ugc428daE4YFgeMfUQ7BshPwwkOrHnnH3fCGP15IbSyAelYevYvVgk4VruUqnq7sh4
         izk13W8ceXzgs8W+7El5Ra0ZBiISLa+2XFSD2SUF9sLi1I5/2Tr7ZInbvK5CFzWeGpTD
         4jqdMI/6bFMR+mcFWt0sPPIboYW1Uw6yN+vb8YI4vHOGKqg2EJFgm452GPZpSqHR+yf3
         Wdcg==
X-Gm-Message-State: APuU4Z/Pc760PrXEIdNnL/RLFmAszsSjhMpPb1WOC8/DxHq44kwvtcvI
	KQqsRRswnmV3s5aqDj322h9nMTJ6nFuErkmxu5Q8t411qoaI+H5CBYg+
X-Gm-Gg: AYBFou1BdTVhvLESvDeR2bzyqlOMjWBhox7OCqVOwvPgjqapDuyIZDQ6iH/hTT6jAcq
	xddpEle/8GlOq7qvFMC7fa05qc8RKWe39HIO39B3ax9ZDhuFriVOwH8scyeTg8563XkYfK5qnxV
	B8H/C/7wFLhiTUNDLEZ439KCvP0hWrZoGeyL6APvABWRauqUns7rqvoStcLfAYKnOdUDNAj6KEi
	vM76LgZwRpr+R20VxD4BHicZOU38sHkFgoBpUJ3gxIWc4FuVUUcPCjEBlED95WvUm/HblQfBQX9
	WscjdtP8nM9TKxHcvOcrZG2gGgV/KGoTnixMUkzDt+e+52BWSFuZdktwoE0Hy3ISdGojrzgFR4a
	QhRE32UBeU4kQoPGxbmCuYo2/fp3194qi5Jry0bzxoaXPVmJcWn783bZ0DGfFzq2iLzZec80+Oh
	92ovG81QGilAs5Hz5gwz2UZ1U+ngc0LK/uWkhWKuCIysTzEBzipKJ1jaE5OW2BGAx5WXl/HFwS7
	hVNrbfhLvfpGqmqmq1YgV1lLkxN3zGwowO0/bMy8bok/lBsug5k2ALT9GBLV3L+6nyCoZoOd7CL
	2dGtbhrcFe0gmEs3g5f/cLyivAEpt0PvDZ5+xQ7Lv7/weUb64Q==
X-Received: by 2002:a05:600c:820d:b0:4bb:6cef:d14b with SMTP id 5b1f17b1804b1-4bb887c34f1mr104686305e9.2.1795205487788;
        Fri, 20 Nov 2026 12:11:27 -0800 (PST)
Received: from vivobook-s16.fritz.box ([2a02:908:e843:f280:6cae:291b:a1:8362])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm115561275e9.3.2026.11.20.12.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:11:27 -0800 (PST)
From: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: add ASUS Vivobook S16 S3607QA
Date: Fri, 20 Nov 2026 21:10:52 +0100
Message-ID: <20261120201127.90969-2-ingo.kubbilun@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120201127.90969-1-ingo.kubbilun@gmail.com>
References: <20261120201127.90969-1-ingo.kubbilun@gmail.com>
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

Document the ASUS Vivobook S 16 S3607QA, a laptop based on the
Snapdragon X X1-26-100 (X1P42100, Purwa).

Developed with the help of an AI coding assistant (Anthropic Claude),
which drafted the changes from the Windows ACPI tables, existing device
trees and test logs; reviewed, built and tested on the device by the
submitter.

Signed-off-by: Ingo A. Kubbilun <ingo.kubbilun@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f69987f..2390568de805 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1350,6 +1350,7 @@ properties:
       - items:
           - enum:
               - asus,vivobook-s15-x1p4
+              - asus,vivobook-s16-s3607qa
               - hp,omnibook-x14-fe1
               - lenovo,thinkbook-16
               - qcom,x1p42100-crd
-- 
2.47.3

