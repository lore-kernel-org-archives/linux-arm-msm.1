Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EA34D0A0E
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 16:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791218598; cv=none; b=uqsBi0DM9F1g1U4ZUfeUw/o+LA8ESE8kVTl3HpieHzSAOl2JlOLZfkOOa7Lmc+oa0SGEAUxxI+roSZrHn/+FsktzZNQUJ2gnIo+B8ZKUUsNJyo5nHnuGhMpFu5/H6a5sTtKMc+rjsTTWukxA/f+3QdiOgy3LeDm1Dvs97PwH5hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791218598; c=relaxed/simple;
	bh=YB+YbwoKBhI3W4nwrDoCGLgvOKJw1wBczHlEC67lwnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bCcfBUn7z4+Vd5QuPQLCwDcVaaDdc41sIVn4kCl9zN+fVLHxV8xfwRlF4RgDWZu3FSaG8dsJ1Dj4ACIG5vqeYPTsJSgce5Zd/v2YXJaZIHGoN4hghSaJuwHdeCqF4j+OItsqXBuUVdn7T44cKgVa4/bumfx4OOWF43z1ys28KOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbHxTNn5; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbHxTNn5"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6063d7dc4so2595601a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 09:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791218593; x=1791823393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5qqgHu+1fJfvGHmeLfFQndeBQWOkuM18hB+/Gz5BUo=;
        b=CbHxTNn5gouwFLhqX6kvWfffsGp/cjztnVn4iVlCbwlU6rbZPiswRykQK39hwSVH0C
         0vDkum70MIfK8BnpRnZgTTIfVJcg2GABOIXNHlmn0vaV50N95WP12q/7Ep8XJGA+Y8VH
         JmcdahN5MFc9JQEGG1ESLBlfIzw84cRNhRie7uvKlD4jS2/Xr/WvjwRueBUwQGrqnk23
         +DnePaeozkosPPQCkzeNoIUmYUye9/PB6lARqeXHyTYz/6EZI8e8E9Gwn417i6GZZFFu
         IZvmFMiwcJgwkZtupiCdvrhUlAqMVrepnbnhAVsY3swrgzI1WXJ/Nplf0tXwJhsWGf4j
         ucKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791218593; x=1791823393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K5qqgHu+1fJfvGHmeLfFQndeBQWOkuM18hB+/Gz5BUo=;
        b=Xryx8oLw8F8QCTN+C0U7WpfspzlJLZcW3Ok4F62C2+4dFh923rY7SevEorWtjyItRK
         M25ar3vw+TJSOzc90dcxBiyaMeNK3eYSgchXEvP2GHfuFZfFINcE99ePeLGenKQMdTZf
         2E8QeTnjNcc6ot2GKibczcMhx71afUzl1c3krit7h08d1oiPY2q2w99Rrn8msaOqJFuZ
         mI58VGW9MUOmyt8BbyXGpDszd4QfPq1tr7ogJG4C3OKdHD9VRXh+U/KsIPsewS44wohV
         47aq/KBX2AjDt/HfVReWyljqRU4jY458wkBfAQ4RmRU/S/XEZXUIjRQ/uSrTCcYfrNjM
         PgqA==
X-Gm-Message-State: AFq9FYK/DdUh8/VPbxAAYQ6BKN/jy3GzrKsoK8fqxaRjgzDKZZKFBa3M
	tXhWCLSOk4hyF+Ldjh+2RXfzCTH4z755hTsG1HZrQyn7g9W+T8+Ypjns
X-Gm-Gg: AYBFou211ncmFyBuKglvLmkPmDstR0D+KiWJyY/Xsq1X15yN2b+4GrYk78dKW7bFrZ6
	2UjxolPH1oaMKDLcWsPoyG4lwHIvbgJ9PHxooHZM67FhrVSScoXIzIRbyQi0sRKOkI5ZdBnzoaQ
	HaDMO1CT5aO2ERDHWWWJ1tzYx7+wH2wuZhYV04PvvESJHuw1/uPTMUM5/RdBJtaJi20/SRY87h3
	i0FBiICcx54+qhBi/9IIJ4L7FrYFj8rF5FFpdmUBqlaXedjQhMfoHil6fmPhhFzTHpgGgtKC5I1
	WoeasA8gdxgxY1BkLvniDAgj4iPIESxjS5jh4yk93e5tQ9yBB2Pf+92rlSCoEBr+xQwaZrkdNzW
	w9o5HFJuDvFDA7oszjmRckHCaULpTHiaMydc+3AYsiwJ8cmvxUeQcAkitbdUlCajykWJCc0V1KH
	awtoo3cWFfutaN2b+DitbbXyoOW8z2a8/uglzccRkSSX2wHSVQIR0bNugrPCsOwK6iytmQE5n87
	yvGDhha0PyQcSL9gSWaM8o=
X-Received: by 2002:a05:6402:24ce:b0:6aa:734b:1a28 with SMTP id 4fb4d7f45d1cf-6af9e2ecaedmr7014561a12.34.1791218593075;
        Mon, 05 Oct 2026 09:43:13 -0700 (PDT)
Received: from workstation.home (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb021af56sm3485851a12.31.2026.10.05.09.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 09:43:12 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v5 3/3] arm64: dts: qcom: sm7325-xiaomi-taoyao: switch to device-specific pmic-glink compatible
Date: Mon,  5 Oct 2026 18:43:03 +0200
Message-ID: <20261005164303.1208127-4-zstaseg@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005164303.1208127-1-zstaseg@gmail.com>
References: <20261005164303.1208127-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch taoyao to "xiaomi,taoyao-pmic-glink" compatible so
qcom_battmgr can identify the device and apply its taoyao-specific
battery property mapping, required because its firmware shifts
battery property IDs relative to the generic sm7325-pmic-glink
firmware.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
index 6f8bc65bb99b..bc4dfa49ef38 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
@@ -72,7 +72,7 @@ key-volume-up {
 	};
 
 	pmic-glink {
-		compatible = "qcom,sm7325-pmic-glink",
+		compatible = "xiaomi,taoyao-pmic-glink",
 			     "qcom,qcm6490-pmic-glink",
 			     "qcom,pmic-glink";
 
-- 
2.55.0

