Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794427442;
	b=Q3lXM0I5n2tFrh6Z2DH6Fm1Z4CPXATwqwZh5brLFJlKMjPTiInyI+2Oy7wbeVslU2snE
	 jpB8SKOCIXFbV+D6Q20I0cBrM6k9rH+v/uoxaLTxSO3bfuW3k2N/secXti1b9wNtw0YT6
	 gU6RqoVukhcgL13aU/BcStzoNWk4wtgLYi204ZYqqyW45Khe/1rt3oWSEbLd8aK7C38et
	 EHNICGqxAUm5ptcCQl5866CdrsoXIxxhWhFAahRS5Y6NZZ5yo6N4UkeWmQ28ShdWlX2Hy
	 k6O4kmcX1ZwT+9tBlWj9ZZGdrbxnvEqO/wVkqIiZc11HK/sndkDOMjaOsBuuGr6AdbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794427442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6rcAYmO2qRHUGdCNLnQyV9a37qWMtLhxA0AKMVNF0QU=;
	b=pv7pJl5ta0INLkVNbjorPP1euYomxOdZHJiPllXkuy25cyvj/JoTAFksoFWlb0bNL1GZ
	 oF02EWecjKkvXcmntOgpljs9qt0cJ3BrIYKS5oRPXqfmxluc8S6kih3NbHw66bNbLiM43
	 qEtX5er5X+34mupFH4HP+xRDKYzvKzIWsefI3vrujF+q1pa7dJP63/nlWJmj1tFMmFBzx
	 YTTDlhdQvr7BgGFRIB/HmBM8ca0a+rXhTJ9GFWCHEmqsLFheSkbrTd8ZSJSFUjHg8yycc
	 yS47FU4/bXp96cbVn4XeUYtqnrJC/M0hOYhuHjFwK84v94lBfmAoIw4BKe7czzhq/kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zugu79aa;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD6F606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 20:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBD6F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zugu79aa
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37071c0f42aso6034787eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 12:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794427441; x=1795032241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6rcAYmO2qRHUGdCNLnQyV9a37qWMtLhxA0AKMVNF0QU=;
        b=zugu79aaBztU/JB/0/i/jqbfCJ7mv+7un6V296+ptLLqHjoNzbL3712fxicZrxzNYb
         jgPTQI8yspdrNlDBFW45xKAx5v3ZcLoHeRd0G28/uvmaJ+FQI9Q/V0Cl/XWYW55Pe/qA
         afLrPj26oqRcsF2gNknTXCB90H1+WLbqscEN86OtcU2/YnEO7yfVsmf8HvTSc5hVzHv5
         OVSD7pigMcFSmYKNwtl0sAsfU5pgaAhHoNnM5/F2u5RkZzVpHHWgYIcRuzn7dZypJKqh
         zP+yFTaW2vvUunbj4av6KC8J8lVtgNa3lRab2dWtVtqB2n3ct+S4raNrjcb28lSCdYEA
         pmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794427441; x=1795032241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6rcAYmO2qRHUGdCNLnQyV9a37qWMtLhxA0AKMVNF0QU=;
        b=ZumfauH7n91edm+ARoE0dIkkrZpJ+4y/Uy5H4oSKTK3LR6E5M8yQl+wyzBX2l2FRVD
         WBJpeJI49saVTPJM2HRZGJkhZFeVSiQh72rQo6nxglO7usSueO08naIsVczke/hqAmpu
         0va4EMNFF2j1UMivklz75HGoAl7ZoqoEoWXOHuCZOB4WjfiBGIFB4L8SEbdCiRgSXfGN
         VY0Das73x57YWyrrOra1WLsRYwMu4cb5n8g+maNunU4B5TT8VPELm3tFDha3973ukaxp
         cDNcXCt2NphwIGsRIjXHaHb6Z5nStgk6D+AIzk8Ncf77co0ZnZ/UWlqyixxN5XK8y/nT
         0TVA==
X-Forwarded-Encrypted: i=1; AL+hErEYFSzOHKqk7BX8V2h00xpEXzykLdZ7LUkC5r7X/ZZ4XrXHMjrKrhYVzR6vY6eZLt9OPkLWf8TSdfYtEEiM@vger.kernel.org
X-Gm-Message-State: APuU4Z/4osR2XZTzFH2AXKq1+QAkIv4qUsIOfVqPniMAjRok6pmgvxzL
	MOvZ9b2KSbkziY2DANurZ9mQzCBYx4Gpmdsnm1jCCqfdE7nroYmNy3g+
X-Gm-Gg: AYBFou2vsHL9E4dXnwy4QqBTQDJpbGazgpi9ERb7luVvZpPBG8s+/OUQLh5uT3IUXyX
	0ojyI1Dpd5p4P9sNbCVX80bEQeczMJmRdQS4K6eGzdzMpqpeeCG5F6IZjJ21wKXKV7ANkCY8LuH
	j4iZo4BuWiheRysrCYAWQqXINC4rZg5+/vYbPNUumc3KbdYQuEBAuGwWWaPpO51SkwZs3yNyyk2
	FWeAFl5Hux6DnoL7A3DkFxX8ybl8zYogoKZNp9EqiXxzi4EJE3Mpq6R3u9ZEReMDfqVUECQlip1
	pi5Hl1rqBhcesSHnHpLJvdqKsaVDQohXksgXv3lhjGZBXGooeStqFcU2d6VRFNSNxJVDJZWMQ4y
	GjqqUhDaqTe/n7aiJpFveENYC06rFDRL7VmdnxqWHu5hQfbUj0SI70FADs/ErA299ov8T6tKukK
	7aptjlnFpF4y8+spftUtfzV13UzPq5u6xwhNdfIhi5i0UhGohB1VNDWui3xR6D9aB94byFetdZ4
	QearFC6WmE/+WNCkgAqAc8ElLrq6t6NgP9nx2k7mCJxi5bmGKRn6yXLmEW7bSzi9yhwHpnWacXz
	QViyIjXLCrRuG3FWV80a7hbw/2UUxp0=
X-Received: by 2002:a05:7300:bf91:b0:372:fa14:8b6c with SMTP id 5a478bee46e88-37685d7532amr4114764eec.19.1794427441021;
        Wed, 11 Nov 2026 12:04:01 -0800 (PST)
Received: from debian.lan ([121.101.132.16])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9d78sm20104476eec.25.2026.11.11.12.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:04:00 -0800 (PST)
From: Amir Hanip <killdeath104@gmail.com>
To: barnabas.czeman@mainlining.org
Cc: a39skl@gmail.com,
	abelvesa@kernel.org,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sm6115-xiaomi-lemon: Split out a common dtsi
Date: Thu, 12 Nov 2026 03:03:49 +0700
Message-ID: <20261111200349.6588-1-killdeath104@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <daea291c5b5d3b1ff87bbeaac4b08083@mainlining.org>
References: <daea291c5b5d3b1ff87bbeaac4b08083@mainlining.org>
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

On 2026-11-07 19:26, Barnabas Czeman wrote:
> You should not override rpm_request node here, you can use the labels
> from the common to change the ranges like:
> &pm6125_s7 {
>     regulator-min-microvolt = <1280000>;
>     regulator-max-microvolt = <2080000>;
> };
> [...]
> Please add the missing regulators.

Hi Barnabas,

Thanks, understood. In v4 the common dtsi will define all the PM6125
regulators with their labels, and lemon and citrus will only change
the ranges that differ through those labels, without overriding
rpm_requests. I assume that by the missing regulators you mean the
ones that lemon.dts still defines (s7, l5, l7, l11, l17, l18, l22 and
l24). Is that right?

About your previous mail: thanks for the dumps. In v4 I will move the
ADSP and GPU carve-outs to the common dtsi with the values from your
MIUI dump (ADSP 0x53800000/0x2200000, GPU 0x55a15000/0x2000), as a
separate patch from the pure split, so it can be reviewed on its own.
It changes lemon's compiled DT: the ADSP region shrinks by 4 MiB and
the GPU region moves away from 0xfa400000.

I can only test citrus. Would you, or Adam, be able to test the lemon
patches in v4? A Tested-by would help a lot.

Sashiko points out that WiFi bypasses the wcn3950-pmu regulators.
WiFi works on citrus as is, but I will route its supplies through
vreg_pmu_xo/rf/ch0 like qrb2210-rb1 does and test it before v4.

Thanks,
Amir
