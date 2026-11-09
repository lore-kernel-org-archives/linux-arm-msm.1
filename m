Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.117
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794262530;
	b=XFq/ewdbfmwXGHl5mV9Oqh0bEunwL/AgY0QL3mDeEFkZFoCwl1U0Kj+Wh9II4gS1W1wX
	 ScnhLAKddvRJZgzaunz5NFywzz9q03HWa9i0dCVx7mipVHN4bDlGLqUhxHE6kz/2++8mz
	 dUZPZHSgW2Tw9NaupbOMxeE4Ggp2JA+SyJ+I8FBLHvKCr+8MRAfdwBLGXmP+i8t9lPvTK
	 g8z3Mu2e1X42ORUBhjPqh6oO+ea4IcmMGzEo+UkLyknJblSo5cguTmFFeGAqIvV6ozaEr
	 SZ6OcGjtGpKFpnGc0+AmNJ9P1XK0ldyyOOAGyjfL5nUcVCeVtssja6HY1WoytziFVoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262530;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4lKRGPKRjEBS3HRBukS+pW+bipLW37WZwjli8JaaFQ8=;
	b=4D0cUNrBN3BDL1Tz58tHd2mdROlIH7fU5JjSLoz8N/jr1EIo+QDW1qLhc94L+mFXuq7+
	 i804lCo2qTsp7PeRQQRLYfCEgadt5beEP9b6T2jdrJe6zW5/aawQu5l+dE9fqSw/AN5dx
	 3lKOcQrNWMKMjvMon9lQ/NogmSgvzMy9zbSITPCER66Odzp3D9uvlBbRxrnd72zJ4vIYl
	 yOFqzV97GyH1DsQM9IBCaKrlK3RlYn0kg6MsgtySmT+ilg+0viqenfKuPX79m1tF5Kk3Z
	 Hq+newClRqZFnkcNMr3U6a9vrDqtNdzfcZFd9J09O/kVh7tZvSe/ogyEjGc5VnRTheg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=VKt3r7xq;
	arc=none smtp.remote-ip=91.218.175.117
Received: from mta0.migadu.com (out-117.mta0.migadu.com [91.218.175.117])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73750606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 22:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73750606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=VKt3r7xq
X-Envelope-To: linux-arm-msm@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5rXea88LMQSd6M3OaqGX1Vmyk7bSpvO4oRK6rdtigS4=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794262527; v=1; x=1794867327;
 b=VKt3r7xqf/S13EV36Iw/+XAB36OHssNTvelorkRg178yhE4gomy/gXZCStV2RfCtZXDz8tj7
 AVCmXZLkTjbsZ5zC2BmWwBuGeNn8+bYoROQemlTezS3dHEkpecKvymvPxxpy7e1jgjzqCv1VjdX
 fE9pUwJj+p+omGNe6VwG2Qg+oL9tkA7b4GSF75xqYEyMuZtFvHEyk635tRcqD5Knrx0qb6jcsRI
 XQcFyr/FkfPz+lJOVNgkcFkZBlV9OPB1GF2gBu+TB+ISekT90sOpeimZS1PtzfKsDaJ76BzfjwI
 O/m9ACLQPPXsNtu7GoRYtqWRnfQ0CvzBJZ5qn/Jgzfr+w==
X-Envelope-To: linux-arm-msm@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4e9c1d3d8c71a54a;
	Mon, 09 Nov 2026 22:15:25 +0000
X-Mizu-Trace-ID: 4e9c1d3d8c71a54a
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Michael McAllister <me@michaelmcallister.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: arm: qcom: Add Motorola Moto G9 Play
Date: Mon,  9 Nov 2026 19:14:30 -0300
Message-ID: <20261109221453.658316-2-val@packett.cool>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109221453.658316-1-val@packett.cool>
References: <20261109221453.658316-1-val@packett.cool>
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

Add compatibles for the Moto G9 Play smartphone, codename "guamp".
There are several display panel variants, start with the Holitech one
which will be the first one to get an upstream device tree.

Signed-off-by: Val Packett <val@packett.cool>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 74f46697a363..37443849d0bb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1073,6 +1073,12 @@ properties:
               - xiaomi,lemon
           - const: qcom,sm6115
 
+      - items:
+          - enum:
+              - motorola,guamp-holitech
+          - const: motorola,guamp
+          - const: qcom,sm6115
+
       - items:
           - enum:
               - lenovo,j606f
-- 
2.56.0

