Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D173A6B89
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 09:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018944; cv=none; b=nsb/XkHflPAJwBqKxb8I9hcmbq/NVN6JGAdHlhRi9sStPYcnHw4lk31oiUfCxxT4Y0ioFtGrsPYjWC4TQHwOsMtRz3g64JCUc/yE6LsCs5EdRMMtoYnIOrsxMT8WZi6nCcCC3BeoBdC0/Fo0WIh2WNnYOfXdw1uUsYM3iimEvj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018944; c=relaxed/simple;
	bh=5Amsj13Ypf+VNbZXqe2Aip4i68WKcfoJI3MkINWORYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YRjDnZipQo3Ti4PP21Qx+vqOoPiSgmTMbIrYQe7tequ4AbvrOVvhga0pEWRC78P0gTuP8JtztN9Xy4tnNBRKwibk0M1VJmMioAiM5J5+ZGVFxhfC+YKTyAbgYPWHtLWJU2D/N/3vAbhh+RdmDSQH1YVvae3c1hp8O8sFFyG5wEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuoQv8oS; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuoQv8oS"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so79728f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 02:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791018941; x=1791623741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EL7Wt7gCvxigatArl4vYdYfYVLxu4uqJTJstEATQ4Rk=;
        b=KuoQv8oSidVn5GsKfTxOq11yuq8ZhuV1nwJ00BuiMrqVHuHD1G4mWS6cvwiPJZptEO
         qzQTTAd5cFrF9MAjvoKNOZgS/K7TmSUfDhVbHrUnstp6T/Igou1ATf/lwUaEo+3SDbHa
         xcO1wuUr8NvjE/9MubWS0sVij+uXZMQt/WJW0IBfvJjgGZVSJYs2C90rnyGDA9GnDLU6
         o6aQKSZukNOsEP4cMqNUN3NSeu2+blA76zvg1NVhAnIadlgmgEiB3j+D5vDDX4VcdBYX
         5TmZC69xKbWzQlxIpHWhzn2cjifKY3oN1yXXaM23Iy/EOa0ii+XZ58duPNkfFCshk5r+
         sdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018941; x=1791623741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EL7Wt7gCvxigatArl4vYdYfYVLxu4uqJTJstEATQ4Rk=;
        b=ldVd01pcbgcypEXAHjRGWNksfM2hgGJu0DdoWD9iKVMBcZZOkmy4doh2B9yvATbNWY
         MQxAOeWEA/GQBAC5HC7y/p04lmlXX6wQIwuybTz+P/3wg5oEZFVndhrtqkCkcZpfEzbZ
         t4CNHP9aZO+EVj50LOoAqqkBE008vXxmbOVz7yikgvyWribhblBHn94tPr1vdydp5lCy
         MNZm25hlBq51jdCVWih7U1GabthUFfsGy7Bz5Nw1xostjgKUSQVDog91HRmjhBKP/DgU
         jiLvTp+tMBwcJ2bSaD/SrYMTmmR0YL8IAPz/9Q8E/GFn/SLOnGBJTMcKqNQ/sDcLSC7H
         A8Gw==
X-Forwarded-Encrypted: i=1; AKwUvBwiZZ3+BR6HYexyMpZRTWKzxNb42tB9+WhUmWoepdnmDrwa04Dp9J3QUFWrSEjDiqek3Xwmj1RU/7lGqQJY@vger.kernel.org
X-Gm-Message-State: AFq9FYLKf5cZqMsOGA+dBlCnM8A2+Hj7y1WjxV1+slfgniWMSdwjwb15
	dh/gUzKezx1exf9WsNvpbguNF7+onYtJBo+1vIDZ/lw8TjyKX7slpMhC
X-Gm-Gg: AYBFou1ns/Dj/wzrTC9xUwg/8cp47P/v6VWDFNwJLKN9Wes+R1DEeMvq3gA41ko2qMC
	evTfTXjocxM5gexHfZzBetZ/GoZw6va9JXTj4ix9MXrAKqyCgFsj7OdTX3AoLPqlsPHIG2MSTbR
	/zJn+S5Nc+Jj4WkrtH3Y892Tg3T8tuGqjpB4JZIsimQQkBP12km4DAzY99LAcE7YEdf+rKBD7t7
	vQN78uPSScjsJWFKv+3lvbblZEfWKqoFB0sOSzDXFrrB4aJ5noviFGlmCa72bUYV9VREvUcarbI
	K2Trae5eqYNFHOROzyl0yGG/IRT+Z6qy/faEHQ15e2vKf+YIPx70cc3uALL2XqYNu+LD8avzX9V
	dtIW4gVUvqFAj0ihAUmUkuNT9nHKZJWydt0v/pLwpCsBwO+5Qw1YABDJUDuRBMcV6wxdvZd6Dfw
	GHXXpmGPu2V45Pxyrel8Jy20q/PuTII2B1AchEmI6auEJwwomhK8OyuESVTYvbbxwFMjfOAB2Tn
	5S27DZcUyQ=
X-Received: by 2002:a05:6000:2c0a:b0:48b:7179:59da with SMTP id ffacd0b85a97d-48b71795ad8mr8328190f8f.1.1791018941391;
        Sat, 03 Oct 2026 02:15:41 -0700 (PDT)
Received: from FranzSP11.fritz.box ([31.31.60.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253dc9sm11336161f8f.3.2026.10.03.02.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:15:40 -0700 (PDT)
From: Franz <franzelfranzel@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Abel Vesa <abelvesa@kernel.org>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 3/3] arm64: dts: qcom: x1-microsoft-denali: disable WCN7850 hardware rfkill
Date: Sat,  3 Oct 2026 11:15:09 +0200
Message-ID: <20261003091509.4822-4-franzelfranzel@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003091509.4822-1-franzelfranzel@gmail.com>
References: <20261003091509.4822-1-franzelfranzel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WCN7850 hardware rfkill input reads as "radio off" on the Surface
Pro 11, which keeps Wi-Fi hard-blocked. Mark it as unusable.

Tested by adding the property to the installed DTB with fdtput, on
next-20260929 with the matching ath12k change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Franz <franzelfranzel@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index a71c29762..36592b8ed 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -1009,6 +1009,8 @@ wifi@0 {
 		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
 		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
 		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+
+		disable-rfkill;
 	};
 };
 
-- 
2.56.0

