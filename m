Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EA242BC3A
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 15:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583820; cv=none; b=AC13/uqgICJ2wFFeImEaMFZlBxq6sNISJb01A6ObDp3T+10fus+3MG0M996md5eY1lfjGcp7LjxwwFhm+Vh3/RGQOcdSPxgLUO89FxwP9I0RKszzZ8gtd9ilVKTHi5csReU5ElNYkxcUtIO776jHhzAhEAMHFxcxk52D2MUcoBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583820; c=relaxed/simple;
	bh=jKh+XPUoJmr7fIpNbx8/2EaPd/67MsZW4ebNDZ/8MPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tBWgy39szuVBKRtnmmMn7rnVxQCkFmQ3U4zdt4lQEqRYUFasGL8m0B23BYd3ePZwamYVDKVKJNXOuzZYspQN+zgcvgU2uDCKUXDmrPmELWSE80xiJjo5q6fC3x9PzPWCtnw3XXvSeFOVIEKWQT8mp8/Ru91cCYJ+zsL/FpNl9kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AllZ3pxt; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AllZ3pxt"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4560d6f82edso3348097fac.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787583817; x=1788188617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQnqfdvjWzHpIFqKpmfnZN4AvVDc8IQ+C2JI25EK8GQ=;
        b=AllZ3pxtD6h27T4HEHXep8mB2/RMKUx6IV559NoJnnklENcXMvKQuvoSjumQG8sPC4
         brIDIlibXMiuCnKDGjWJdbrHSO9Tak3xyCP2I9VHPLHvQuOtOKnoiaTHTFtBVZ+YzJ/z
         ibpilitEFi49VmhtQBke7sCROB2xBwmGgEe0DjDABHWfWZudgwdwF90OdAcOtmvOo/bL
         XJZp+5MbXegAhpUAirb3cHylk9Aa1fIKrz/jdd0mwUFnvsz4NWKc5MmaU3ixhn8bmkp4
         eXJ0qguZpWDs6AFzbspfXzEUbY0iyP6h9XJigpK4W7P73tWcEFOg8oEkQQWB66M9mG8m
         V5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583817; x=1788188617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QQnqfdvjWzHpIFqKpmfnZN4AvVDc8IQ+C2JI25EK8GQ=;
        b=U8IECUVANcmZ9Em0Q9etQcDnbSDHE9RcQXjpATEsFIHaFKC0CLtXTlt93hw8UKyuzN
         stwiNvulcWssSurk1g7mHlqhB1R5fVZAknJrqemgdDCEea9/VoIJYPilN6ZWDp1BKeur
         nYYgYw5918O8FFaFXHD76h5omkNYOA9y2SUSjWhOiTflEN/6lQ+Qn2PTxOdUJibDkXPM
         5OdaUYLfaPCWVXYcPqFk2maU4LW1J6xg3q5x3Z/ZKRSJezjf/RVqjnaoXSC4JaxVtDRB
         ES9xDFrdaPzC/dTCptWdMT9ps8WmQRd/5lol0cYAirHh7QR1cGC0mKFFuYY/9EJhzQV4
         6AgQ==
X-Forwarded-Encrypted: i=1; AHgh+RoOXxENnaqBd/yjwyE9a+s59ifx6O2kvl/z+4C9R5YRges+WvXTDuOq92Z1jzu6Q+iSAyKfu6Q/2VNXCSzW@vger.kernel.org
X-Gm-Message-State: AFuF++ko8LWcrM2U5yPjA42h3cdvhSScaRubnvXgN3LlfOAUA0JJk38N
	iOxfJ9q5to1Xbsna694myfpjUfRZgx130tm48mq77cJGfk+xbDieRoyM
X-Gm-Gg: AR+sD10jhgfGzLBLWxZf+ciXNaRLDx62FE61tMoZk6fQ4TGPpDENWU6PUNIoulA0Pcx
	vrhuYPhP6PUv92lwYN6t/HLhpV+nZKgccNvEwnxbdw5zqTFt025L8LUmc26KlAHifHc6Y8COfHM
	TdrSKHCs11j1z+u7QdwRP+A+rLOSUv/yFlaxzmfWBgyVuaEZ9cl33/6i/aaUNYZT3voVSXREj9I
	XHDTQxXc1np1nPGgwGvUFz2QVigShavZ8+R9GWmQwsYU+zDc7d9ioTGF33+F8xRv1xcZcpOQgfB
	ghR5UtTpPs8UH+5F6bhZOovigZxsMuJQjBN2YKU8uLNEcupPEtlzNHp8UQri3b/sPusOeCWab3d
	/mpqkb9oDkAC6RydA+cftr1gPSlJ6Zo1sOhwW3A4DiyTKcJ20gUFSjUsH7eV0JLQLT7XNYZcsuA
	1QTkENSSrxYXhqIpAyBb3pi3WYM+SDOy3qJANGfIj8eZcSLyEv85a2e202MSmop6umN79IcNDaC
	Jw37r1PI/SH
X-Received: by 2002:a4a:ec4b:0:b0:69d:e4c8:86f6 with SMTP id 006d021491bc7-6b1592b8c96mr26911121eaf.15.1787583817353;
        Mon, 24 Aug 2026 08:03:37 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d381csm30035247eec.19.2026.08.24.08.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:03:36 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v6 07/13] dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
Date: Mon, 24 Aug 2026 15:01:50 +0000
Message-ID: <20260824150156.1310-8-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824150156.1310-1-sreeshankar0910@gmail.com>
References: <20260824150156.1310-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the RPMh power domain for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0a45e1f55..e08441915 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -63,6 +63,7 @@ properties:
           - qcom,sm6350-rpmhpd
           - qcom,sm6375-rpmpd
           - qcom,sm7150-rpmhpd
+          - qcom,sm7250-rpmhpd
           - qcom,sm8150-rpmhpd
           - qcom,sm8250-rpmhpd
           - qcom,sm8350-rpmhpd
-- 
2.43.0

