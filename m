Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864314;
	b=RLJYWrEEN5QpxnX9jImJNGnus+WOh9gFfOScWWpSslLCyu87wlP+l7TCBQ3himyB2gAL
	 UYpxnlSumdrZ/WIA+keN5lNrZjabok23qzJoVzJdzy0SpcVh8fZIba33K1HYUPI2KvOQC
	 Ix/hv8pqQpH7PVyLtalLfEYsQ6rKS+DSnRnDTJ8xXu1gvRWHeWYSvpDGzjQheWsDxqY+W
	 ObFZM8RnPNOXXalHyBPtwmqe9PP6w/9HdD6cOub1BGdVGSZzz96EWYTDkI+GbGOBxKzZX
	 GjKspC4ZgdmUcQvP71ThDky+DZ2FZX7Ncx2Rfn708ZT2R0y7eI+e4ubOw+LWM9jfyFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=TQn2kGhWJbaBGD65fKWwqKtr6XDMTGh3Rmtbd55zkps=;
	b=wzDUxWnVpB18fxJ1BMifx0lPRgBy4CjdlTrrYVba4SW0sbcmlU/ZrJDwflyx2NttC0Li
	 Hi984UdILJiJsQXd31OzbxhUT32ew9tHpQBNZUz3Yzuh/d/viyuweGKOKdURWe7cWIbRm
	 Ni9mXTgfammajJLqr6hbtd5SwXfchwwJmpgGgPmXloRl/AmnpiAoJ5y+SKtew0ZrR/iB/
	 WUkMC7fi/Lvl0jpHpTIE5J+7wiuz3UnrRZa/sW+snPgKVZQhMshDNEzkqsUZGuwgEgHhx
	 +xK6/IlHz/XqtzB4gBUV40f5lmmdgANol86iE5HKlLRvkHUe/rd3HXFz5qiA28VtLiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=crKqWpBy;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1251606A329
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1251606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=crKqWpBy
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so24691575e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864312; x=1795469112; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TQn2kGhWJbaBGD65fKWwqKtr6XDMTGh3Rmtbd55zkps=;
        b=crKqWpBy9v9PmTiWD5cN4fT6cTPSUgRhGGLMmQFSUba8ExVSKF2vjESeXDDhOae5pA
         rka/KPNPbUmqrz86doZE658P+yDvCys0FbcqJ018GzsU7GCACJ4O06ZWwGgHaPMxA2OD
         ytTESXi9Hcn4bA8D1y02uinkXD4u+sRReZTUIqiKVJGQdu4hQRfNtfPYK2mQsCxvXiti
         PEIdXijhuXSwohct+dh7Qh3Rfoh2sRFjHXqa5TT5MyEMDzSO26jZYkC8X8a1GDfbt1Ij
         8szutdp+XbCjFldFdxWhT/sxaFGGpgMMmbg89VoZusnty0wapoSXJc9jEKLdSZekifB5
         4ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864312; x=1795469112;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TQn2kGhWJbaBGD65fKWwqKtr6XDMTGh3Rmtbd55zkps=;
        b=HxClN4U9P81ShmtTVdEwJkJmTFqOn6NaybxpruWZy/oKnf/3YhSvKTYQv7P9A2JAL4
         NAm1IZZTBnHqblJxka4Bic7p+6wfoVndecPLszZqEHAx8KV5WcI5wqzpHdcsi+SBtAEj
         JFq/8c4IiELk2B/w9PJ44uq/PCeoAxKm1NdMwpbqm+3T6jtH76iHc4H+JToGDDDFRkJc
         VlB/tpMjUZZnecSyPsBenJQat/qD/4aNLdWdWk4cHyFj0Ap/Obxr9xbAqKp2G33A7tPj
         L67WGxUOOCAGOW3wWgIjbiexjLURq2vQHoDYWK8CAgajM+dJnvM6QygGz+58SY7tkHO9
         xMWQ==
X-Forwarded-Encrypted: i=1; AL+hErHdDlt7OfuY9j8NBzHV8p6IAFqxV+MS3+TNOvTAkVp8JZMmzUN29WuwAJwBlTPlrfL5ECvk3oa6NT+pF9Cw@vger.kernel.org
X-Gm-Message-State: APuU4Z9ez2ij1yyhR/ccbeQ+amgw1HplxHtN3bmRh4JiCeOFhn4PML4Y
	zuaoj8jtQSzLZr9YSYfzP+e5kMMqBlqkQhKs36znRBzTYkKDnSuQKCR3BEPnGxA4d+jXsQ==
X-Gm-Gg: AYBFou3PeTwKieWGgwi5e0IN0eyicZO1bYXWjwANyLJ7fmg/4GlhoEyJWkSjFJfcqPS
	j9DESu4KUioT8hcvCo4KxaHvJWSPVvKf3rXABLof+M+Nyikrs7UdYXzF9lwlWIEzbFohDkjIf2y
	KGih1AKII03fXwKiMgsjSerFpPc05GIrMDPSHDCp7wtnSkiuoFptC1wOYEUts4Y2/DAFisbKyfF
	9LpN4uQJTobkoDvFnwkSQRAHY3h2XLn59WfCnnyC/phVQrn0ad0SFcW2UZF/rkGfRjJJCkrT7xs
	2KgWMdLOZgAzugqH4pPll8hzD8uBZbj7BifHsleyz81RL7c6p8+ygj36QlQGXMElEcvknmW33ha
	LvLN9Q+CL6gYOpbY5dbW09Z59rqbgfL8jmAPSpSroG9Si1/Fmmx4yp+NKisaVD4U/k3vRPIf8pU
	vQJa3RHpcMP0a8Rt5yT2PmmfMH5CvYNTKzeS2rrEl7qjqNffytCzmORQy/F7t+Oz9/x0XG5DdTW
	31882L7qfeYGHV72bP0Ds00EfgC6P5XRq0BZDfwbplBgclC0mf5gVjjoM/klGNORCNrb64q5fB2
	mP2cUbrScByzTq/CFC3fFeke2WwEG2Vfnwdx+8dGgLhMFrhOZfPJ1AIYkNL3Gw==
X-Received: by 2002:a05:600c:8b81:b0:4bb:5f45:c97f with SMTP id 5b1f17b1804b1-4bb5f4f93f3mr183128505e9.27.1794864312370;
        Mon, 16 Nov 2026 13:25:12 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783854cesm26340475e9.1.2026.11.16.13.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:25:11 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH v2 0/2] Add cpufreq support for Qualcomm Halliday
 (SXR2250P)
Date: Mon, 16 Nov 2026 21:25:05 +0000
Message-Id: <20261116-halliday-cpufreq-v2-0-e518cc055457@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIALF0+2oC/2WNyw6CMBBFf4XM2hqmKFBX/odhUdoBxvCyBSIh/
 LuAceXyJOeeu4Anx+ThFizgaGLPXbuBPAVgKt2WJNhuDDKUMWKYikrXNVs9C9OPhaOXQFImuqZ
 IMr/ANusdFfw+ko/sy37Mn2SGvbMbFfuhc/PxOeHu/fLqPz+hQGHTREcqiVRc2HvZaK7PpmsgW
 9f1A8w7k3LCAAAA
X-Change-ID: 20261108-halliday-cpufreq-1e9c3581e2b4
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864310; l=1354;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=Vl3mWqPNXbM7HXPxqhlw3hT3lk2vRli8dmhGXwQ8GHA=;
 b=mUNNSB18W8LJ/FF5bhpDD3vmw81siwfrYgshJoZ1CBZT9EROHlU2rHOC6cPim2pc7eyXwRq4A
 GwdTh0lHIa0CJwIHlBExQXh3MMeIBeUNkfF9eAeGGTMsHnlz/DDr5mZ
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the CPUFREQ hardware (EPSS) of the Qualcomm Halliday SoC and
keep cpufreq-dt from probing on it.

This is part of the bring-up of the Qualcomm Halliday SoC (SXR2250P)
in the Samsung Galaxy XR. The DT changes follow in a separate series.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR, where cpufreq runs through
qcom-cpufreq-hw.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Changes in v2:
- Add the qcom-hw binding from the DT series (12/17 there), so that
  the cpufreq patches are in one series:
  https://patch.msgid.link/20261109-halliday-dts-v1-12-289114ab8197@gmail.com
- Use the "cpufreq: dt-platdev:" subject prefix (Zhongqiu)
- Link to v1: https://patch.msgid.link/20261109-halliday-cpufreq-v1-1-d87a397396fd@gmail.com

---
Stanislav Aleksandrov (2):
      dt-bindings: cpufreq: qcom-hw: Document Halliday CPUFREQ hardware
      cpufreq: dt-platdev: Add Halliday to blocklist

 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 drivers/cpufreq/cpufreq-dt-platdev.c                           | 1 +
 2 files changed, 3 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-cpufreq-1e9c3581e2b4

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

