Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643754;
	b=VRrgCls7csXxUaoxn2hEQq9wfPt8e9fuGFGAbrZdQ+IP19y3LrPLi2h+sEAQOPZ5AyNM
	 Uo7iulAvES6iWsBWjj6ynQnS0Kt9k0GUmyKuvMjJls/Dn+WkqYXCo//2+R80VERd21Q/K
	 7nee02kvMGXBLjNN8KGbUvHLfRhTMGt0RCRpgtTeso2RM5QE2QQTTe+JV0xEjrAb9ci9S
	 JyR1ssp3h5z1WfRHM407enxnV+4wOPpahqZeAQkk3i2qI3YOTMzlGINY/AEBmibiuqsJX
	 dGw22MDiC+YFb2mR44g1nf71zuvFNwD7dvs+3neADSj0esg5eXc1SZrkPg4d06sSc6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=O5MpsdOOKt6WYnEOMw+jiBh7wLSAzt3pbyqRaYl9xCw=;
	b=hCpOTgg2Mq+HHT71xdGIOEaL6l3SvUhR7e6Xm+B9qfpkTpVpJvv9qhmxO9CqMGxn7TFz
	 GozB4oV3XwMOj3s2DgGguE3tZMz24KoAa1HVbJ5e8veNny6wYWBOKs2Ntnl0gdHpongCp
	 pImV2Sndr7Pme8nPBSymlHZTUCRklRfvtc9e5qPJt7yobOEYBqjviyZ4y2I1LKtT9kHxm
	 XBcieLKUkL3MTxb7tXw7dVPUofgb9601okZ6zjsRhjxEJnCZCIzaDxct6javUtWStKN0C
	 Rr4a1voHhXaeLidD36e4+xsTeMjn7V05IJPqMm2z2+zUV5buxqfVs/r20x/vC5z8I1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QYdrHTrP;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59238606A330
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 21:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59238606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QYdrHTrP
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso13074004a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795643752; x=1796248552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O5MpsdOOKt6WYnEOMw+jiBh7wLSAzt3pbyqRaYl9xCw=;
        b=QYdrHTrPhMglMeTWmpJY8mRzOL8k6sKwd8JlnzXXPNBtCcJCpPgvDL0SxMbyvWXxPu
         2rzNKPPunQctCkMUJg6ZeR1F8Iu5IXx6ShD4cMnYUEVF0UQUdtgMCKKRlrKo62xvbgtb
         s7Y+j3veXN3VOokGRGjoYtsAyJXBI9EPtjR7ltxOAOprTMrJ6NTdEMCD7aHsurKR6AE/
         l/BHsNdeGaQ2zw8sAgUuRUtPJ339DGWibZRw6wpBHWhb6MAF/VLdpFLoajZNCKRDAjj1
         HFWlfLH9JTmaPt7wNLzT9yEuQt72YW9JidIFcNNrPU8Pml6qOx3n6aXqC2Ab0TycnsSo
         Wfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643752; x=1796248552;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O5MpsdOOKt6WYnEOMw+jiBh7wLSAzt3pbyqRaYl9xCw=;
        b=ZOMWm9WpaS+zyUf66AfmKvI1YnV+e6M11s3AQs3tMBRIaKJXgarNuEV+OMevkx2r/6
         QsSM3RquvmhvBctC5o5KcfMj8D7jpjJw7kZyht6FwVD7cH7Vh2mK0sZKTccLlPFQiKLG
         oGub0vG/Ow7tO3TZy3gIb82uHn9xfGah7IqpzaDwdpXbnYxDRgI+/jw8u7fAWndESJ88
         A+3UzHDZyN40CP3/iQWew5PHyccgnIiKMGBr+p37QzaDugmj6fotMGCRM1MiycS+/qPz
         CI+jfNOf7RIvD6/r0WgmDZpTBRMjUjPox0hgUPnR4Y7tKx/WpKN6NVghitactRCGLC6B
         XVcA==
X-Forwarded-Encrypted: i=1; AL+hErHT/Hq8uCDR6ke7g+pOKXzcpEocTH4Elg0PqUm+xlb7TcKg0ThUtrlvQyigrynznuKBDRQ6/HwSKr8sV0iD@vger.kernel.org
X-Gm-Message-State: APuU4Z+2W+iUWFSkp3EvABERYla7Z8/8HZxFoOlXlq/ptzEaEV/XH1Ti
	14f/ciLoTFBufqb8rS0wN7BRdcXkwn14gc8aefvqhYCG7VEp2ltE/CQ=
X-Gm-Gg: AZFdTZeHjtqBE30F0r2wBXjIOq6BkHHNDKTqmcRfMKSR2EbgNN2N2uue0fYFaOSw7Jx
	SPFwbAiuEv6X/7lc9rRmRKqzksasP1drBo8qri52y5BLSZ9+3hYBFa//Dp4TMwQCeqfSNU2cLXe
	QlvpXnjTh5kokYNkBuz3qMOLPK+td22apO1BI1DLZauzB1vb2pCa90ToHfvnMNpCU3GR28Qrbyn
	5iWdFALVjr5lmWx01LOvAfVLNixeZ4AKCf3/MSCA2JUngLoLpBWTLpAHFogZo/DVWqhAMGwkMFR
	wFzrGwOBIJj+eNW3PFn6dpOfTCUpA1BrGThGq9JjmhrMJSZllhkeDUaTCHb8ERKGguJNUKKOo1f
	+fk0kqvyvpaSEW6g0CxpTnURNv4L0rMyqJiyL4azNUfpEElKOTGerG/IQ0ScCJIrCUjisRopYIx
	sq1Rf8MKA5bl0X4wNniX4AjCCB4+TtOljur0uwnLR99e3OzwNY6gyoNT6Hy0Jiop2aazx4GEWcW
	tBwB07rp4hbxVLaVl9hEft+Ru4OXZOgLFeBKKa+toeZZb+Qu5jZlOIEZJoCTwJoE4MAO3nY5H9i
	TN41rMc90Q74efmGEiN06cHrofWbrjqsBxgbndz5cpwT4Ikkp+EG7efz2FCxY7yHH5Fk9CPC49J
	8n9RMzS6Uc7+6FgXYtFw4xADWYQ==
X-Received: by 2002:a05:6402:370e:b0:6bb:b89:8ee2 with SMTP id 4fb4d7f45d1cf-6bb0b899043mr4209318a12.7.1795643751507;
        Wed, 25 Nov 2026 13:55:51 -0800 (PST)
Received: from sohrab-omarchy.fritz.box (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e77d8sm8608871a12.14.2026.11.25.13.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:55:51 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Roman Linev <admin@mswin.me>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: qcom: sm6125: Add cpufreq-hw and CPU idle states
Date: Wed, 25 Nov 2026 22:55:48 +0100
Message-ID: <20261125215550.1834075-1-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

SM6125 has no CPU frequency scaling and no CPU idle states in mainline:
the CPUs stay at the bootloader clock and only ever enter WFI.

Register addresses and idle latencies come from the downstream
"trinket" device tree of a Xiaomi Mi A3 (laurel-sprout), where the CPU
low power levels match the SM6115 values exactly.

Tested on the Mi A3 on next-20261113: cpufreq 300 MHz - 1.80/2.02 GHz
with schedutil, WFI plus per-CPU power collapse in cpuidle with rising
usage counters.

The binding patch from v1 was applied by Viresh [2] and is no longer
part of the series; patch 1 needs it for dtbs_check.

Open from the v1 discussion [3]: Barnabás Czémán questions binding
GPLL0_OUT_EARLY as the "alternate" clock. The driver only takes the
initial (300 MHz) row from it, and downstream SM6125 (trinket) does not
bind any clock to its cpufreq node, while downstream SM6115 binds GPLL0.
So there is no hardware proof for that clock on SM6125. The binding
requires both clocks today, so they are kept in this version; if the
clocks should become optional for these SoCs, I will respin without
them. Barnabás's own mails did not reach lore, so [3] quotes them.

This is meant to go together with Roman Linev's SM6125 TSENS series [1],
which adds #cooling-cells to the CPUs and per-CPU cooling maps that stay
inert until a cpufreq driver registers cooling devices. That is why
#cooling-cells is not added here.

Not done yet: cluster idle states (PSCI OSI parameters need checking) and
an energy model.

Changes in v2:
- Patch 1: cpufreq-hw regions are 0x1400 long, not 0x1000 (Barnabás)
- Dropped the binding patch, applied by Viresh
- Link to v1: https://lore.kernel.org/r/20261115003158.391171-1-majidhhdri@gmail.com/

Based on next-20261113; also applies cleanly to qcom arm64-for-7.5.

[1] https://lore.kernel.org/r/a3f071d3-6082-47a1-bb00-9d8e72fa3cdd@mswin.me/
[2] https://lore.kernel.org/r/avvnF7zQfYhF11so@vireshk-B250M-D3H/
[3] https://lore.kernel.org/r/20261117173547.1656090-1-majidhhdri@gmail.com/

Majid Hajiheidari (2):
  arm64: dts: qcom: sm6125: Add cpufreq-hw node
  arm64: dts: qcom: sm6125: Add CPU idle states

 arch/arm64/boot/dts/qcom/sm6125.dtsi | 61 ++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)


base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
prerequisite-patch-id: a01c38e015a1f9bc178b74a4a2451f6170eafb54
-- 
2.56.0

