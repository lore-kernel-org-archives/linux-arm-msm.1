Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794341114;
	b=grJbC0xCPoU+BPrEnnNocXyYmo4Y7LEWWcYrHwZuTgt+iybXEy1mjpfXdqirTWB13kuP
	 tdYLVBhLQbsiglnHam3prHz6aoIsmj2C0nf/8Q7yT6aSrKE3BrnMPurc1lsoVkb3XkTOp
	 UYJibPuttdiPPi5BfliomSajKWqwAX7ieITfUH/YMm+3yUqQ9zICBhQyaadxTsT885F5L
	 pnLT+nqzuaMcTzktmhw2tR9JatmWQUkw4Vl5ThGIGVCtVnNypMKuZmrgIFapmRjR7pEqe
	 PB41xU301Wzf0zxDUD1wK+PmoEyhpdNZgwrL6cz5vb2mPbJ0O100UYuaCUmCncy9o2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794341114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ygUwbvCgR8EJ0INYVhYaEUA+QbfoJ2U/iRHYIVhq5NA=;
	b=W/dUCBUnKyVd+c2ne1G5WnV+7FCEW6ynqZA+P6CzY2B7MaZ5jNECKi2IQJIYHQ1lAzon
	 b8ASaYBBnxqRVjc72sGm1ZQb/H8XM0HjBDwOTHUN34am+CvGHKZT8AjIA50M5Ana4DwrL
	 jDU9WD65b+Y105JVLjhW9UbBYE3wYE+bOA1eiZpSTDWoXdo868FGb51ScPPhM27yjp02n
	 oujzhFJuNF3dAKU4CuVlf4z/tsvfwpV2kqbB2MdaqT7PuP6BvOuMP9iXG86iXCgfLXE6z
	 pejvXxBOjjurbuI77Hsrx/8aNU3KXVYo/I66Dq27A/aOOr17ikARvquRaTFexizLnrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O3JxG09s;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967F5606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 20:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 967F5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O3JxG09s
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91e8938fd01so27110426d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 12:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794341113; x=1794945913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ygUwbvCgR8EJ0INYVhYaEUA+QbfoJ2U/iRHYIVhq5NA=;
        b=O3JxG09sfOPQXyY2Jbj/5vnyw/wprNi1mWfkH9fhwBL/IZqfGFDFKlC4qZSo4GR0/z
         Cm3zKVgy8FdT62Wy9KJL4yhL7YqGUNBczznzR4ZlfNRldoXJqT2wYz1GOvfbfxoMBDI1
         7vMJBBR6I5aVQLNI/NwS9ddt223r4CKtLy55L2OBQB4YJbW/yernVloAbeKnqNkiEfJk
         IMHJn3h/JG8GN3UZHhj2n7h4BPN5HQFAoeQD+Bdl4o6AsF7disKeWGLTzfGBfOkp7WwE
         dkZJ/oJ6DY30ubArQ32v3HdwmBzP3wFK/hBot2l83IV/nc/jGSa+m72yajjYiVit/X3V
         D9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794341113; x=1794945913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ygUwbvCgR8EJ0INYVhYaEUA+QbfoJ2U/iRHYIVhq5NA=;
        b=jke4Qfv4K08RJO0PfOhiz/OLBbLpOWtzf8vkvnFoqjV5yaerfS39lOp0gpf2r+Itag
         a+f0nEIgGTfh7pl9gVw3FemLVV9Qa78o+AMMMTIfb+K6F5KYvAoTfbTboWK9Jg5xk/9C
         Nd3wAh+Jq1I1nZ4WbMzduOOWefxRvaSq6gmWXcATJW8A/0ARx/bHlv1MIhokeN2wBRZW
         F0h2GG7Il9rJ6nZqy8kPh/S23++F+0EArwr4cS4RoWuI+w5TrFZdbLXi3Db7FGHJ/gqL
         4F6jTnu7hRZVf7Drc5+bhtSaaWjeu1ToVHT94KzuzyZnRa7VRiQvjeCpSW4tNYE9mROD
         wE2A==
X-Forwarded-Encrypted: i=1; AL+hErHuk00o0B5wIMejii2zOYQmKHdl6BDaFOosyBplycW7v8eM+bhdIiCSzpBxLsU4qGceP51e/kDcrb69Pxls@vger.kernel.org
X-Gm-Message-State: APuU4Z/2Fe3F3yioZDoS1nJCej4KdrK17Cec5unkW3h/ECCg46pOLE30
	uetMVrpwLXlmuHIhhfeY9T8zDLwA4CNN0S5PWklVNcq/LQR+ii/Lnk/R
X-Gm-Gg: AYBFou31jQvikq1VksAhlLa0XHNgkkLP5jkMsH9iKUVhgdzu4oFbbkUicyw6X8F148p
	SpNHqpdksaVXwxzMA1TN1Npup9erh0dadVehmUVzvIv+ATx6P5Xr7sgX0lIrJwDN0qYx+ISi/pF
	1p/c601K8gDYHwxLDwS15o0nlVxUeG6UbvpSpBt/Krwp3dOVz6hjG8q/sqmz/pi23kmC3J1Cqwm
	uHd38sdD1AZQcWuPUEcu+7Xg+zKYtz+Rbu0V1/COF+ggkALJe97+x5Bv1xKphTu1xQ1SIMUkABo
	MHK63/Jh/9m8MSBQyby0VUgYvxkCjDc9vAf2nlykvJkzqeqVXt8npUS7wV0dO6nb1ZUXztNMKS1
	zxFI4ShfAxu4a8dnrRiiGfHZ2/2O/3Wm5od/pON+WN1fAqlufj28vAewvOhfaWHVwIA4kXl0kod
	ZZ07yCKVehlbgg6XcUwL76+HUwuhFu2ZwjhH5VuTkVVu+uuA0NYQFXsmZQF6uNFTP1vOJM1oTk8
	r6htjY97o8Pt4AY5Zmdmu+SUvjrGfKqmK8gYjYI+oFSKVoWDhOMftcU6a69KcnvSwN2zFbWQXsI
	edP7r8XIzWDRFiTXrvRLAeYn5WzN5OtbWVJieJuE0SelF0U3zzmlW/ZnIOLmzJ3CXro3nvrwb1A
	Fln9x8xRyvmZQHCchOiLpwVmlBLsJ3Zk5SI8Z3SUp3c/J2sPfCprpDcz8pIRCUkGZCNw8jMpVzs
	bEFtFvnoW2WhVpxFZYHYJWTylQDZvzrPfmw7vq9RXqhvkuN9GOg/9zHs1S02gFqPigBrSm9A5yn
	7hwPpb4rqxJZwjNRglwPE32PCHkrfs8D/YFUTX8QovkvQ==
X-Received: by 2002:a05:620a:4106:b0:93e:c12c:4416 with SMTP id af79cd13be357-947b00317e7mr4760385a.82.1794341113438;
        Tue, 10 Nov 2026 12:05:13 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:940a:c6ea:f292:3644])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e76b1c3sm305084285a.16.2026.11.10.12.05.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 12:05:12 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: use polling mode for SCMI transfers
Date: Tue, 10 Nov 2026 15:05:11 -0500
Message-ID: <20261110200511.71673-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAEaxeoQUZKnCQPG_W0B77gB2VfC__-t7ZxY0mkVsqm1Q9pk6hw@mail.gmail.com>
References: <20260808172211.137577-1-jesse.casco@gmail.com> <642652c2-af5d-446c-ac1a-8099639c2588@oss.qualcomm.com> <CAEaxeoQUZKnCQPG_W0B77gB2VfC__-t7ZxY0mkVsqm1Q9pk6hw@mail.gmail.com>
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

Hi Konrad, Sibi,

I tracked down the timing issue on the ASUS Zenbook A16 (7.4-rc1 based,
arm,no-completion-irq removed). It depends on whether PSCI cpuidle is
already running when SCMI sends its first PERF (0x13) message:

- CPUCP_MBOX=y: first PERF message at 0.37 s, before cpuidle starts.
  PERF works for the whole boot, cpuidle included.
- CPUCP_MBOX=m (arm64 defconfig): first PERF message at 1.1-1.4 s,
  after cpuidle starts. No PERF reply ever gets a doorbell, so
  scmi-cpufreq and scmi-perf-domain fail with -110. BASE replies still
  ring.
- CPUCP_MBOX=m with cpuidle.off=1: PERF works.

In the failing case the firmware still writes the PERF replies (the
same request through SCMI RAW message_poll returns status 0), but
RX_MBOX_STAT never gets a bit, with EN=0x3 and MAP=~0, the same as in
the working case. So it looks like the CPUCP decides at the first PERF
exchange whether to ring for PERF, rather than a mailbox driver bug.

Please consider the DT patch withdrawn. Sibi, is this a known CPUCP
firmware behavior? In the meantime I could send an arm64 defconfig
change building QCOM_CPUCP_MBOX in, so defconfig kernels get cpufreq on
this machine, if that's acceptable.

Jesse
