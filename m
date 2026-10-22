Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792704051;
	b=HuDbcPyk9rrPuYPzqAgNRokDwyH9EwqzlKrbhbQ4C2BBXXt7M5bnXKCiVk7aQ+bg2NYt
	 I9yt7urS5PPK4EeQyMVvqGiQBj5Y920bVtl2fO2xmuEgdnFKzBo3Cqew3wWsLS9bnus/t
	 QULSr6FNzSwosVyM9eLggFtWoVlQIkyrDqQjWjX9Ex/G/jqyzH20ou9/XEhKlQEkbK3dt
	 2ihTYJLR1szwKgnn2S5XQwpekUwlVWAqzEbEqAP4hPVmughf9MdJVSngSXoKNB9jL+M6y
	 QO2wvNgk7wGxwRIBWcCLvUu9td/jEEIUHAVf5y6xqcqbtxdHIcgqDG75KBu+3oQ19uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792704051;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=80wrSG/B3VGkS+ZZcthzUgcL0p6ipfvHuu8TjHdZlpk=;
	b=D7Fq1Ei3Vl8m8p2h56XQvZLShry9LUD739RETKqe2fJN1+54kUP6tXPJAzaGsnHZkOZs
	 8Q0jnGuuBbOK1nWd+VTxnXiFA3n76pJTW0xg/oaiFdEhPDAjx25j17zJ5ZamQ2EBHWFBg
	 jfZrun0r3tcJpGFWHu1DwxjSPrVkKbynQ4SYRFiiOqSkpELBRHte1nBdqljxsMTnuRIxF
	 S3jW8YcqdLpkROIxjvu1adZPCYRhgd3caskKELJNRvaUqNycpXsPNE5ddHoqKa6X1SakW
	 063pgU0th9zGKvZBkaQhiKM+XrZgf4A/eYyIfgOxtzViAMKIybsS2o+M1LEGEEtEgfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	arc=none smtp.remote-ip=79.135.106.111
Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CA1606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 21:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55CA1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1792704043; x=1792963243;
	bh=80wrSG/B3VGkS+ZZcthzUgcL0p6ipfvHuu8TjHdZlpk=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=I1Lg6isBhZlphlQ3vltRNAJlyhjxdVfv07YFnWURqYMETlcmVW/9GQYUlSxyYHuv0
	 i3owUd8c1lmcV9aa9HJkbPUsrHNq+IoHkeXsvD6cc+WkzLQeejdQRmlEpV5BJo48Uv
	 XFDnkR/a+crx7rw9dMy+ADuVqXvq5oN2+9v5RDyNjw+5OHHomp78uHIF89NI/SJ0sL
	 jTYUkOH+Q9MJ4X6GBUs9o2VMBpJ2vhE9mhtuoUAuXECRTY4E7CxJRkruZ2wJc80zrL
	 V/YrdwGsutTVcBR8Swtafd4Jf3qAljcwmMpe6MW0xdbA9QVKg7VJPUU9fZBmhJqt0T
	 +7NsQy+i4GJsw==
X-Pm-Submission-Id: 4j9fFj4nLyz1DF5J
From: Michael McAllister <me@michaelmcallister.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 22 Oct 2026 21:39:43 +0100
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Motorola Moto G10
Message-ID: <3878c144a3adef2b734e660d0870fa3488d36570.1792703903.git.me@michaelmcallister.org>
In-Reply-To: <cover.1792703903.git.me@michaelmcallister.org>
References: <cover.1792703903.git.me@michaelmcallister.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Document the Motorola Moto G10 (capri), a smartphone based on the
Qualcomm Snapdragon 460 (SM4250).

Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce..963fd482be 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1051,6 +1051,7 @@ properties:
 
       - items:
           - enum:
+              - motorola,capri
               - oneplus,billie2
           - const: qcom,sm4250
 
