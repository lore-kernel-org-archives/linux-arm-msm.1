Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864303;
	b=fTk3qttU9gcG2G3D0ij4qIc8plO11FuAYZQ1zUevr1EZW01riUjiQIyih9ugLHRfl47x
	 8YK7A7nm31zqgDXJsEQ0WdjL7c1+vHUKlwDA8wmke19yiAhA0oHLG26xCwtMlIcdCmI27
	 69XoOWKJpZY+0rUmQnSZ6r4qINBOoOwIDwpUxtRbX3+UeLJc0yFbQuUBXx4fa057FlXhc
	 UQctnKE/CNt9UyCZ1YBw2VPz2VfZsAq+rD7PTku9R3U90tJxMuR9AI7jnf6nBS/rjQdnk
	 AHPYs2aUaWOwWgBsv122JQa9AGSqw4WtceyI9JXnswzNjwMF3279Z8GVVdCg0J/j0zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=S29Bz2Ne+XPBujKOM8xk1WUI0xBpcjEJIagUum0EBnE=;
	b=G3+/3eGHo8Lu7S7h8nINkRZbAH1gbn9953Ks/hcHSfohj0b2vMZ1eihOwL8luoY8qH5q
	 P8QgXNO3uCBzksF7MpF+zZBlh9pukWG7BXvGRkPlFOJfb8gzww96g+IBAma++M8MURw2K
	 1l518uwCq/4eBXs3sCJc6S3JrO88l486GsYwtSAOIUGmVtLukJ1Oll0g+JVHwitNHN0UX
	 k6K4kmON3TaSCIlp1Y5i+Que+sN5xaLeSIjG/V4R0JrjWw15FH2VfoOwhhYUfK/5zYwvZ
	 9kPQI5xYkk/MH9lXJ4D6Fu0cGYUsMnmVkUojS9WajIbjJNhUpnCadXl3ZssQ6pSVg0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0aKjn/XL";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BE7606A33A
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3BE7606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0aKjn/XL
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so14711225e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864301; x=1795469101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S29Bz2Ne+XPBujKOM8xk1WUI0xBpcjEJIagUum0EBnE=;
        b=0aKjn/XLzFlq+ouSLmTYWiErYU4NZycee0SYeWHS9aLIe0k27WBTRX6PuWRoYn4h/w
         osp9TkJMyV4e5+eYgwb/9Uc/gLhNZxiGr/cttH5JB23s5talTINxpiOqouDaU3q7DwXB
         mwpU6hyeU/LjWu661kwdEwa8YWFnc3lth2ve0Sqe0d48lh+EH/wFJLkFUox+m6kZw0dS
         J92PxdfemEiGhqmuVA2SNm3IqPkf9BqTxF/YNUaHrDdDhx/nSjKqb0Hx0eq6ATmkC5Rf
         fjAx65WnzMYxrFtCFvtUBlwnbLTSo3jUeZRGoWgkIs6XsEOOy781KWog3D0urTndgUMR
         VDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864301; x=1795469101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S29Bz2Ne+XPBujKOM8xk1WUI0xBpcjEJIagUum0EBnE=;
        b=d1oxzq8aCVQQijbR02dJ0jdPL7Dfp4hDm5x5dvPw1H808Ldz+4fAqk1jldvRTdN+Mi
         6LE+i1Kxw8wfObIIr8OrDl55ATieFV8IDnzGB7sK7SDtTcyJk5a5XAw9XK6tc8Mif+Zs
         yXMRqrS6jmM3N8gIShiPcYLmfIOdOraJBax8/x/f6EatJSJ7LDMPoWz+DxlFoOvdDJln
         mApVp0mzJ7VVMDMvYCwuroVpO8EkLmqP1Wfak/MtKjie04ItklMpa3oC8tq8MNMYRnW7
         xs28nXVEXfvzK/YqpBMrzOpWsqCABWYWMIUJGxygfuB29bV9eFgkHggOf1FSUGnO0qnz
         6Cvw==
X-Forwarded-Encrypted: i=1; AL+hErF7U/Gwm6dr85oiAUsHBIY9J+9sOXdA7MjSNoRQi4rU82Mwtz+jEM+iV0VdJWQvXYhbrLjLBahP7hdE6Mrw@vger.kernel.org
X-Gm-Message-State: APuU4Z+RdYpsikKnpE+O8pqXf9HRnyTABY1hoAh5Wq9NxsUwO8iiNlcH
	7DEVk34oPkAamQmGAydY23Kq05QfFyqIW9CAYvCXVBadJF8wjO9WupJc
X-Gm-Gg: AYBFou3KKZpZKQ/Q+9wr0EJC6W64GtgMDcQlV1oheH5LIvz22EPNTudNi3i1t5oE6x8
	6j6IUTdbawf9vEpV37bdyCC/DN1ye51krXtO1lThI/BoDwPuzwjx4rqR6zjfzu/kT6ZBGtGKZZy
	R4c3MMATxmLKD4nsh4j0M0fIylI0grL7hirvN7hX9mlCd6K8/trwBXgAudc6deEm5pGBMfuN+Y6
	UsjJHPCrwC6LYui7gG+ldCh+yU9zmN4iy527DGtFJKZ591K30vpY+nsf+cnSEPGx5I7QYCCxpvN
	hitqPjsdtT/kAWvuBt8j4NagHcyHBKfx3LfKNQxAVAmv5C0PDC6JnsTfr+NA2oWhv0YqESZlqDx
	FJqIUz7A/uukIAdTP2c6C7ifwjzHDeQI9ukMxy6IBogagJnfA+stOteyRo/rXZrn90GL22V2hQt
	yQCAAjlH+dJ+SwKS1yWxQ1znLaHI2nfXLQuh/Lz/rui3fxnQ3qH73k2a/QnA5Zw+tp47WE2oaDs
	MRzSw/7ww6m5cWE8j2HVT8tto/fd80H40drNwU+1U2JStg8BTxS7ShRCqvTCEXVbsCj2V4OGr3Z
	utidhFcFtu7Vp/Hn2YBxUI/L5EY2b3XJcPrpLuFs
X-Received: by 2002:a05:600c:4e13:b0:4ba:38a9:85e3 with SMTP id 5b1f17b1804b1-4bb55a47fabmr248067435e9.12.1794864301100;
        Mon, 16 Nov 2026 13:25:01 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb734b9f44sm61928305e9.1.2026.11.16.13.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:25:00 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:24:51 +0000
Subject: [PATCH v2 2/3] dt-bindings: interconnect: OSM L3: Add Halliday
 EPSS L3 compatible
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
Message-Id: <20261116-halliday-icc-v2-2-6df8fc0e0620@gmail.com>
References: <20261116-halliday-icc-v2-0-6df8fc0e0620@gmail.com>
In-Reply-To: <20261116-halliday-icc-v2-0-6df8fc0e0620@gmail.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864293; l=917;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=wd90pl7MHpq8clj67rbDiWzxPjA0DsOg6ijADlg5gec=;
 b=pz/bm+cpBSVda5rEAkb9kL+2qT3hhvKvQmxholpBFeOsC/Cid0Qv8sM1w+T+AtXgxc4c8y4H6
 3jNx4bfGNe4DUgR0PLStj8HXNjGipU5Am3ti1DyClnFNFIdI5YKWoXd
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the EPSS L3 interconnect on the Qualcomm Halliday SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
index cd6685683bab..6c3475005a35 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
@@ -31,6 +31,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-epss-l3
+              - qcom,halliday-epss-l3
               - qcom,milos-epss-l3
               - qcom,sa8775p-epss-l3
               - qcom,sc7280-epss-l3

-- 
2.55.0

