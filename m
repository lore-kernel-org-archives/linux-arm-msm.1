Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978196;
	b=3MIWxJQXdORIIdHf254wC70uBx5XI1rsb/AnuuuSe9qfdZCoj1kqcl4PdpsaC+V1xjs8
	 Ym/NO2dZNfwd/tud/UX9rVTW09uxcRFukgpQCYsbu9nUMyJA9zvn2zl5lg77wq5Y99zGQ
	 o8/MlA1kJx28vT8W+D01bDtujXoi+LuXab2uG+fbVWEr5+cpuIY+KVaQLpfXbgHDglILq
	 boG1THiaygPfy+G9tdwg4NOt2k9MRJzKdFgVPdmz2d6jpUQNGTUBvvKKDcVUubBNnnhk1
	 r2NDN+/7e49OEeyXun8mctggt8+sWB6ZaZ7tMz5fF5tKCHfB6QXZlKbQCVRL3XRdtwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
	b=KpZqVDOVB2ELiL2z2aBsxo07O0xGI7XC5Jqn3NHjMFEZlOAuzgtpwyNyyuz18b9nvoFR
	 bH8cf3jKoV/zkUlly7F14uQaUzuX+EKwxKACm4mRqEWh6Bt0X+g2jGHDYlc+XEAvJdzQl
	 tgi1MvmtX6661wgmMUSwInvUZS88mmMio2tHGO/c+VvGuPwhDt/+uvrEExE2ghS7sSM4L
	 2EYs60pK1lYY8YtK2MJPdb5ORcsE3poIXNrtvTazgjh4zO4ZJf0av7BiaRAdp7kNFzLJE
	 Sd3zjrPR+D/g/aznlWGkHp3mWkVloLZZmCJJ9DSJs1dswueNww5RGWj6oa0I20+7SNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VSAql/bl";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29618606A333
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 15:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29618606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VSAql/bl
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1204795eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 07:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793978195; x=1794582995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
        b=VSAql/blJeBuuXf8oV/4c1oADv/6SuCiNGnvgI+jYuOKHyIGlQ15D7/sdKN9NYl7wx
         iWb3gjWga3J1E8G9FKpUYgRb6DlbuIVWTvdwzC26viaTrL5X/e1VaVMZq2hRKGYiTyKc
         AzJA2l7qjJn2Mc1QtlCTO4p1IKMjHrPtdGWx7FFh5JzaZLCJx1/6THJc8ZFaWaZqzM1S
         nKBjJKH7mCdHSKmW5xbNxlbH+Z5gd+UlcG3taSFzBLnJflkRpuoWZLJ/8kI2Le266Kh7
         ujLXoS/MNkIY/yhfstFBjlc1JV+W2xRm71elGo+uD2WSg/eUw/2g+fiok9jCC7qj1L8X
         l76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978195; x=1794582995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
        b=et4fnVoc/qh4NzMVKKEH2pqpwtch15NJGDX58EXwdsziXAbzb+SLenxmWKTixjHSy2
         ekyWYaoQERcbpDUTyuAgQ2z0NGtLuQ0rS27cRuGZul977m24Y4u7mKiYd05avniABgjo
         ifLmjFsio5NUsIRHZ6TKVpFObanirBYGgWBzGAu7ls0joCWwSs6CRuM5epYrh5IFw4+W
         4OO1tmq8sUtN/IF2boOdvb2yUvNpA1vURoMzakNULH0gawlKaCT+n2BO2brFJWZcTrYJ
         i+TE8i6DoL+j2MmDQomZrut6/kgmOW9Bo94kuujfOO+htzqlQHyR1tpNtsHBKkGp9t3T
         gu9g==
X-Gm-Message-State: APuU4Z8wKfPMJl4dF/4ofwsijK8JCK+xAAFh1Mct9N2u2sSptJY3kx+/
	a8CO+yI8I2SEylQP1jefJJNMghbbebK/+N8o0EYntedaB9eAK4dZ7Ywk
X-Gm-Gg: AYBFou0V1JsMpZbrgn/Cq15XaWaAgbjCogtpxHiOysp9wNp5z63WaS0KQEvR7vXCwDG
	I/7wkm67hmusk5UQykaHbL6zS/AUOHNxuPLVmnAwiMvl5Hf7qCgsipeqkOQEzla9r+iI9eum8Yz
	tZ2XVzd9UiThgjQfomSp+nKDCRAFJr0pO2npIr8j8l5XrdrjUXN0cZa2QS4V+aCYCKLSXZhm/GO
	UEdG1TgX0XmpesJH+ertd+6o5pjS2sSn60OzSgkJM0c8hTENn75W69fvkZxOEN4+0NRPxqTEt6C
	26UDeaYlWJHQTQhSzoIaaYL0MUqPEzMbV4aDqynZpqu+6NHr9ylXRb5A0Wm8XnUSItBWajuKxBv
	BrRCZAwhQ6XdDDdhzd3S5NrJfwH2f5Ex0BXJNSt4bAjrbcFNy2PG4fMYY+ZBDvptCfairAft3Sr
	vSmlKwmBCbrhrbzwfxqINHIF73kPyVCNjVOcrb0z7iZAcyQwq6ml0u0wK4AFnKQn4FaIHfK0mNX
	Bdf7h2eFco3adgmGg9PIXU5FYEA/YC+kyrarI7sqoULgMMM1XVh++viCheUihQdcJjf1iWyCSi4
	70pernxHZJtrS8inYIeQYfHHpnein86q6uoASRbSNzxOAb05B/mz07IN0G/ovgAgTK0i6JrN9ry
	w2SPp3Sc=
X-Received: by 2002:a05:7300:ea8d:b0:361:167c:2364 with SMTP id 5a478bee46e88-36f76814de3mr3562020eec.8.1793978195003;
        Fri, 06 Nov 2026 07:16:35 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.221.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm7581500eec.18.2026.11.06.07.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:16:34 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Fri, 06 Nov 2026 15:15:39 +0000
Subject: [PATCH v14 4/8] dt-bindings: thermal: lmh: Document SM7250 LMh
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
Message-Id: <20261106-sm7250-v14-4-7d167e993f9c@gmail.com>
References: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
In-Reply-To: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Sreeshankar K <sreeshankar0910@gmail.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793978147; l=791;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=VBYR2sSJ7gPSfZ1zDIlxykyMXb9GohC2X09rRKZ3wIw=;
 b=tA+YO4IEziw/rxKUuLOEgg9oSmL+N5rlYkZXd62GE5c3l7KwaJP7/Ge3KIv/yGEwS6/bV7IKD
 UTf6B27Bw92BqD5ffzrs425wCTGWhznBDR5PUtFGQnRPV1dh25cvGBx
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the LMh compatible for Qualcomm SM7250 SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
index ce72347e2..e1d5cb871 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - qcom,sc8180x-lmh
           - qcom,sdm845-lmh
+          - qcom,sm7250-lmh
           - qcom,sm8150-lmh
       - items:
           - const: qcom,sdm670-lmh

-- 
2.43.0

