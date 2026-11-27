Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795821308;
	b=I5dqbNmFrRsC6AlkH+zrRTrQzYvKN180YdlVnV8knzlAkyvlQ1EYyKHES7XnzIkx23Sf
	 yB6H+unCvYl3k8eybsYGRElrgdzdBffc3NNRQfsTOF+PdwvzZdQWT2T0WdxbQzFYwRCvj
	 EIPdjPvotT6XYNn3xsNOSQGG0mo0PwdHt8AN/IbT2UyQ9GdVfqN79cOMmtr2PNIkM4mVq
	 rjO4bHkEEq6ac28vrktbStl/VC1dywSVZ+Rx5ojSQV+UG1/xBk/9hcaN6AUu828+xgE2g
	 P0TuiyJZ1SFgT12tidqTcdKh9B1PPtS3P6bfk/20LnGTI0jpiKA+Pade+CX50pGktNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795821308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U1M+MDeqlkODjZ50qKjXMO75f40J30DxxF3l7NYSGEM=;
	b=k/ZrvPNbTgvmPrss/a1AlC9AAxwQQ3qk5LEDcyrd+IJrjP6PAyi+piMnAomk0ZqvymbC
	 gNPN/nWai5CcTWJJKoXJ4Ae4BVkt5Hrq5ksqUlz37CYhKtDR3cMjyYDfXTZcfKl/d8wHP
	 HH62vgiBpPvySkpib/ax3XTCVOyCvvlmcDLlBPT8oCQNckBzPpQ+HRUt/rhN/Kuc5eAvd
	 v9Uz1gUQbMoZGF7DKrqyiaBpeaWRC324jEP5PhNOqfx0MZf7P89iZenAMsjoY0JmXX0sK
	 dmBLFlp+IEeQIhfsfHUKb9XNRoLrYgqjb0m4gIXC8MymCY4bREUbbFBry8vlRYaGPAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WDrBk4z3;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A27D606A33A
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 23:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A27D606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WDrBk4z3
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so7732766f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 15:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795821306; x=1796426106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1M+MDeqlkODjZ50qKjXMO75f40J30DxxF3l7NYSGEM=;
        b=WDrBk4z39jTSJg7fP1LZv5pSAmcolbmVo4wwWMjjlFQboYBu3wN5rJ9GYnYJV50K3+
         tkw+jwH1lJXR7gVV/OBT9/yk7tTAiZrdu2ajb+eYT+UVhWfUsEfp6iR0FSExSHMDzvsZ
         3fpjMgMby8qPK4rdWEnPxtHr3jKM0uthso6MfAww0lrr5k/+C3OtKtXfdvcLi7gHPltW
         qCeMSaWpCWUuLbQVELMCkcXgultuZ6nRhj58FRGzZaFMWHaLx3Tjc30C/hZ5vAlCSiMn
         7dF5c687gdpqCnnInSFJs2GpiUdsUfdCYGv9dUppGS+08fFr1MS5RebwLf1K2w2KKf8y
         FyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795821306; x=1796426106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1M+MDeqlkODjZ50qKjXMO75f40J30DxxF3l7NYSGEM=;
        b=vF5BzvUCeOil5DAklnSgAvFQkuwH2aX7NbA1g/fQU7vP+z7Ug9sFTEd0lMODvWQuML
         3NfSZNcHsrB+b35Q4xc186DzcIxdFyUer/yIgxsqIZuNNM9IKAuPDU7hB9Kwscgr4fEP
         Naq7qRDNbxziyVJZ+e/4QU8kgVAr35QHVmhD0bUR/wgrz+LbGFbaVMIrOweIqWaSMuYK
         7PcNzSg2UhNDlWy5pdEcjC2uGqfyCHQnDodOKljWkp48pR8CrlZXuK55dZe81CHEtGh7
         J28p7s7zRz3vMeHc79crjcr0Ptv3aCgsrY9OJ/46YJKv9WZoUKSKRhtqayAEPB9UpefE
         FTjQ==
X-Gm-Message-State: APuU4Z9AvfW/aJ/pbRjyyhcuKA7HxmnLCxK9GcR6PX8diI3kQD04ohwA
	xrav3WGcUR4gSjU39+U8mYLFdRo17DgwCW3tQnL8HHbaxIbjPKYgXAL1
X-Gm-Gg: AZFdTZc7hhS7bEzJMqIPiFjANAln7yaJQ6tjhDofgWyZcY8DaNdyTsK5Dg0kQHzsofx
	oRGSnblpNO1ziQ/Lk/r7DUg/dAg3QLishLdxFnck00vst0n1T0PLB/jGCmrK8Ec8Cny1ovRB9Hx
	yzx5pdWF/844F0ZIxUwnQVnEddJBGzk+vXliwPrCG1f45snL25UhRrof9wHrmeb2I7dxNUFhRXh
	lVkds830Rh5TCVwAXr81/+82Ul3gpv0jjKfVPwp6flf/VWjAfh2sBvSazV29gZRWJqDVLD+BTx9
	Id8gE301Ntc/+owJs5FtMnlm3t1rfD7VvDBYxd5dPRIGEkJKsOQ6kdk92YmGzEOVQ+6aWIo+ybp
	2rtmwxMo9InMAvok5kOTHRn9WAYXoXWculDE6nwyji7md/YexPxH0sfyqzUAFQPGbQ0YOwkWbUS
	tGJLXuzT78rOVHAPxm46GXPxQ1Aiq/sZDD9m+HsvF2uiWYkBeUT1ukAFE7Kq6hji6pqWnRNWL7L
	od4Nv17tRpSFXNSNs52I/Fxv+GvsF884QX0jxfhqH8g3bDlLIxKH5rXSHFQQr20ECkEcAHtMFvU
	aqApl8vzhnxnH5mPpWvzHd2f7QY=
X-Received: by 2002:a05:6000:178f:b0:4bb:c85e:d565 with SMTP id ffacd0b85a97d-4bbc86e17b5mr14733028f8f.55.1795821305534;
        Fri, 27 Nov 2026 15:15:05 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm45269880f8f.23.2026.11.27.15.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 15:15:03 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bean Huo <beanhuo@micron.com>,
	Stanley Jhu <stanleyjhu@google.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Georgi Djakov <djakov@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 14/14] arm64: dts: qcom: Add Samsung Galaxy XR
Date: Fri, 27 Nov 2026 23:14:45 +0000
Message-ID: <20261127231445.3623202-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87280d80-9047-405b-8dcc-11276d34d2dd@oss.qualcomm.com>
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com> <20261125-halliday-dts-v3-14-5c8311c0b70b@gmail.com> <87280d80-9047-405b-8dcc-11276d34d2dd@oss.qualcomm.com>
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

On Fri, Nov 27, 2026 at 02:58:40PM +0100, Konrad Dybcio wrote:
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for the review.

I've implemented support for almost all of the hardware in my
local branch and I have found that the headset exists in multiple
revisions.

So, I'd like to make a split:

rename: halliday-samsung-xrvst2.dts -> halliday-samsung-xrvst2.dtsi
add: halliday-samsung-xrvst2-rev22.dts
add: halliday-samsung-xrvst2-rev25.dts

The .dts files will initially contain only compatibles.
The real differences between the revisions are the DMIC drive
strength, the display panels and their supply voltage, so the files
will be 'empty' until I send my sound and display series.

Is it OK if I send the split in a v4, or is it better
to do it in a follow-up?

Best regards,
Stanislav
