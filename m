Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243864;
	b=sK7kCN5t+r9l2tGcSOAhKdTR7MBnLXqZsPg8rXlAlZQb3EeV3Xw3S/+EIvPP/HUo8o9Z
	 bLREpaqfN7g/daznhZPVA9vFrzu0bmAXhdN8L6o0W0lzeN7i4D37Y8sH/d9bc5MpJUyhn
	 +BQRwUhFVujMmfN+ezVY/DUbJRojG9/J6+uWscX5zuQsrGtM3VijrKUtjS7fTQ8VBMTMx
	 wEsr0ZepXPcPSc9XLiqvQ4nYnn4jUo7HZPPKuhU9GA5CRIfNOKVwyRknUKkMg/AobWFkL
	 Hthvrl2/VWC7XZ/xAjMH7ucEChMHYaP3Z/FWaqibNZNe2tXWkWubEKZzSfsInfL613A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VmhgsZdfI41q6bSk6Ws0aoyQukpnInOpVRPvZF0DgoY=;
	b=hXRyXhGsSQ43I1slHlB180YOt7xx+4oEya+9Y6MeUoTM3NAVLdgjdiY+I68GwYAVxpYW
	 Or5NCOFlGdBBbQiEJ1T7bnOGjYN62jsFcuQrKaRYuVfyb+jUVSdn2/km4hyHKrOIDKZAX
	 TOieR07Nkwkn13FqU4VYudU+8GYRU77Advw1ld47jt022TO18OJJA2eCh02BQwPz3aHnH
	 oGTKjWVqSO9xyH9crTtd97+I+Q0KqpMPEzXDI0DUmXEnG4K2GalgMhIUpILlgwguqGxqZ
	 1847ojlRM1mXNvM9PCyK8HmZbvjho4tIaC47J1t/eK5yOm2kDUxPlfH7wnZ+moCqpcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INMhwymN;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509BC606A334
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 17:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 509BC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INMhwymN
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so1359051a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 09:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243863; x=1794848663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VmhgsZdfI41q6bSk6Ws0aoyQukpnInOpVRPvZF0DgoY=;
        b=INMhwymNUoXRa1HYjajYs2VDNOXoDzVIp/an3nVGMwTgqTKKIXcrYlToz3KguYeb2w
         0JSHPrAS4tp1u64diFxx98ot8r0Zd994Q5w09w9Wo7hRC/DtQLXBMMh5MnMbGm5sg/9+
         bfSbd1NNz976A12xlmIC5rBcyt2zgrNxYngASmeZZcCyhLh9b9uOIuPyOYnguxqTaeNR
         9hUslwRJlODcmrjO84K/MqZr6AW6G7obz3aQhSgpfQbvfDlBiGQqmaSqVNfiSLuoobIb
         SEhjw+R7G4bUMif5HGg+3AGlsX3R7zQQDPntqdP45khUAZLh8+Utt3l4+Gfo8W0GMqsn
         XheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243863; x=1794848663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VmhgsZdfI41q6bSk6Ws0aoyQukpnInOpVRPvZF0DgoY=;
        b=YflpeXG9x8RjZTnvaCHXJmNAhLkwKz/X4vSIWd3FNQCU3QzhgVtt59kWtE3fegI64q
         7P7JgGRBRStyKyTZinZFzL9KHo0zVUG71aDUkB6zRpUKWfeOs7W7BWddKFc9swuPBETF
         yB/igQQwK2CcS8DCz2Hup1JNv/svIBTpEgPYm57oEFsF1mUUiqS36gE00zfmJKJxmcBw
         6nWeAoaRSQiVFVYAvjvAcBOO5EyQ+BnlfRQtWeYJiuwqbT0W42QcwWnE2kQz1kC31+cG
         Nmji8ZAdT8ul1jyz+ZjhpE1zgfHn0xeSj1KpORisTcYEebtLmLuTJOhMdiNIt8Ch808D
         iruw==
X-Forwarded-Encrypted: i=1; AL+hErGgkShODdmmj8cZIkz7Y3vSB66UnUyFCmAFy8m6RwPIy7Mmvpp52TvuOb8zdGcaQHNhDD2fC13CbnNEeT3B@vger.kernel.org
X-Gm-Message-State: APuU4Z/C1cZhQyz6fIOuLLR/PPBuN6hB1YcbdbNw6tfGzX3nan9nUctv
	QaCsCKoevYzj/GwjwfSl1yOWpA79V0FO1xETwFkQPqAlg+Z0tz8Gy2SD
X-Gm-Gg: AYBFou0z/l+9eTuBgg6ACEXnx9rfbSW6X8x9qoYJqx/6ImjwqhyGBO2XFFqT6HIJtqA
	nRs4WyYzs8mv9LLG1QIEbm6d988nHSxQZrM3tSuJhu9gHubNpPZlRcekvm2CbMpN9QCAQ+JnOa0
	EpyBOQHMWFPTU1J310wdHTD4moLSQSmZ+7MqmWH6kvyrwbZdOdUbb5JcLLAnPaC9CIB0GZJ+nTK
	DF5o6wljoSZYvGaEGQVuwcn6MdcYJ+LDyXFSu9MAf8usmD+UbyW2s1LnMtEPZHur9SRYdQoh0tC
	qfn+MxsZZ1J9No1ABq5z1js4j8K2DCmuIt+393ig+tcJuHJp6qqU9/qCy0ojsg7Lnh93XmXQ5T9
	SYgNG3TA1yJ0lKZN4OvkAMBo0hbWRPofXW2XpWMKYbybYykQye48B2pCrbykaN61775dNG6QUAH
	XYp6jVBlT7GUDRlC6/8JdfGDLf737JnGV1ldcor2lScu/6x5grj6Wm78An76+gWjLrJ1Zd9MyVw
	jrpJuFiGoScVIEoZU+QtG3m2BVw/ToCGJ5DfLmnCA3FHTMcPHr/Odfe31ubFSUa2bKdT4q2XVm3
	+aECO2c4FkHHUocTH0BIpT4Wy2I=
X-Received: by 2002:a05:6402:2356:b0:6b5:7792:d82c with SMTP id 4fb4d7f45d1cf-6b756ad7482mr185305a12.16.1794243862514;
        Mon, 09 Nov 2026 09:04:22 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ebe31csm1878937a12.16.2026.11.09.09.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:04:21 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Lee Jones <lee@kernel.org>,
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
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 17/17] arm64: dts: qcom: Add Samsung Galaxy XR
Date: Mon,  9 Nov 2026 17:04:07 +0000
Message-ID: <20261109170407.2073295-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <3ddaacfd-59c0-4d87-9b8c-2caa85143393@oss.qualcomm.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com> <20261109-halliday-dts-v1-17-289114ab8197@gmail.com> <3ddaacfd-59c0-4d87-9b8c-2caa85143393@oss.qualcomm.com>
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

On 09/11/2026 16:12, Konrad Dybcio wrote:
> On 11/9/26 1:33 AM, Stanislav Aleksandrov wrote:
>> +&usb_1 {
>> +	dr_mode = "peripheral";
>> +	maximum-speed = "high-speed";
>> +	qcom,select-utmi-as-pipe-clk;
>
> Is there no superspeed / dp altmode in hardware?

The headset supports USB SuperSpeed and DisplayPort via its USB Type-C
port, I just haven't brought them up yet. It seems we need a new driver
for the Type-C controller.

Stanislav
