Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089352;
	b=PRcx6pkcnjuguzsXeXSaeZc6c++b9Z6ZtCtRtpJYSsyrxsXZ3ZPX30aWFHDuI6dx9eF8
	 s4if/XzAvjRhaX2pqqK55imIJxsGSl+a6l2/o9GI9rq57/e+JDTBxXhBPwLU5wqOjwJ8E
	 VTZx7U6QiZJxApZaNIy9MQO+OxhgxN2MhILoUmFs3g+a7eKJ2rQ6hfzZs/v08W2F8uCNX
	 83+P6dhui7ipgKC4dOuE5FuXxxlIpO4lnhZNq166SnpxpNpZfXI2pHOoGG1of43KrbPpx
	 aJ0jsCJncCNPuMmSneEL03RBe1OTmwpPk801/fgHXWrkPdKZbc+cy8rXFT9Y0kMfx8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+q+RfQ5Kwv1XNt4YuEC2Y4+X+a7USu5opNal/bTFsOw=;
	b=sznuza+T9K/bHGBzlQdAWwe67YzsyAzM43agfcu4HPfa6Xd6Ir1ToZ6oG3STz2MBv9os
	 NcC2+qUQCDHXL9kXAYKsOeDYEK2dsQGxkOWTpwRC0q6wiqWf9UfBY6VI5gpuUDV8+J/9/
	 ae54kT1ad22aFfU9LipqwH90GWFHdO1E4mbcUYh0LIyPMP7jEXFXXjiAxaYUPAlgw1sZO
	 7GM3ZB2vpdghZ/QwVR8iDqYGx/vNckjkkBgrMVN4SQ59ZOXUZBTGo3sOFhlVZ2469+vzC
	 HTgT7ORH8zo+8lpWJJmuQRTV+4tyz4ZMdQ6FAex46TNMtSD8re9NK9DnfyW44VEUebw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZurG5xut;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184E0606A327
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 184E0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZurG5xut
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35d0be18c71so899863eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 01:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793089351; x=1793694151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+q+RfQ5Kwv1XNt4YuEC2Y4+X+a7USu5opNal/bTFsOw=;
        b=ZurG5xutDCh1J7m4GPD1L2fxDLreUhtXfCdJ/Qc0XSYIV3caH9ozgfgRsilfd9MiwM
         WqfYgBCJvBtKJGTxAl+ukXEnDIM+oLtaQcxAsC3+fO720QsZGx8qlGNHlPALrypI92GJ
         LtRZdAaL2NHqNNLZRIM4TJESul12xrc0r1TIg5UH/gfHCaqnsimeF1+ZeIaQZscH/hl9
         0bZr2dpbaagVpp2X2K5xAjUFcHdgy1jIaXKXDDvk/xUQyKR/N/yB2GpO2IxGfpypJz8E
         RB5Jsf1R2fhyL25ZB+LyOMYJn2pUClZkIcopdr9zlORMqMXbPvV8h+V+1lVYpFSV72Gj
         Eerw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089351; x=1793694151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+q+RfQ5Kwv1XNt4YuEC2Y4+X+a7USu5opNal/bTFsOw=;
        b=vv5TK9sDgbizPltBpP8ClcPXDiAy9SZ0kKMCL/qEXaxN+Sn5YIEhbdPJNNdH6TUdrz
         jWMLXUp8LsbffbIPXKSfn+tbM6m3Xa9SyHZvyX6eJvGs7qUrqzB/HNNfA02KzrlaexZF
         NAOarWKI6XTspYcPzq+cco7T90EFpKEd4n1CCZrLW7K6UrHwPVWw00bPVRPauEAjaQ4w
         rkEi+tu9Lrq1Y0mIZqToLGuV+j3ox0z2NLD8EhGA++EJovkdNdexoklMb7PPN24aE9ZK
         WZ4MZTla9A2GhbN7TjTUWgWTLA8SDbIeMIXvnDGfMuby4GgpsyKZMYm/x4NeAUNEUJ1W
         a32g==
X-Forwarded-Encrypted: i=1; AKwUvBxNUHBRqriKb2gUc9ej7x+x8KIAW5wn1NvN2BbdWz8SN+0nFS33bH+H1ZaqTuhxXd1APwyTECYiMms46KBK@vger.kernel.org
X-Gm-Message-State: AFq9FYLsR861q1oWWb92AlvBk3Fqh5ZAVf6jdRfLtpkRSL9B4fLHbAPe
	RZlWQVSBa6cTkVloua0LgxJxG+esh31SJZ0Wr7NBRYJFMDExuZf2Q1fnbsGPIJQ2xBI=
X-Gm-Gg: AYBFou1knFZFiynzds+LfBh0qV6i7ERqNdw0wUiiW9Uh2zX2ci4rxRPbzkRZ4okKE5J
	rrmU/gqxyjicjTOW57WWU85ZSNdKm3jxMFvl983CweRBOfkz0J+f08aokqC8Qh9lje1Q/5MixR8
	aTQV66OFmKFjwUZ3hlhdt89avLkDAAMdb5Rf5IqVfPQR0fxlHuC+2MYaB34GoRrLZESWWRWAqF3
	ZVur+oWjH2Xk0vBIfbq5sowVdIEyUatcJIFg2+FV9EU0/AGp190RPvJ0VHTttR69xJXtQ3JPVDt
	Jqlr/MLm/PCFSXmeKEk/ERn3aM6qcdVabGY8GUkrKMIyBWaQKzdWxp/K2EKkL/rylIpX3f2Zo8x
	8dH13b/UF/DWJ3YS2zsu4jSs/GbOrNnS7/2P1RO2tKA/xD5VYd5stL9PYk9YTvdrGUT5GZTlkts
	zmRhRBxxpuKWcxFaiziaVuLIS9gZcJShs0/M2WaYEm84lKBWytrwQKTtjSLW7WfEbTG8QLqUrIx
	A6dvJ5B7D0TcHReP5Cx4DpvAvp8BBnMfW/RNjEMKoCwbwYkba2WNQjpl46IG16zbT8gVIue7aq/
	3nHgPI9Rq8OK2knytGXJa5cWJ7DLjH7kfizN3mBsOU9+Ag==
X-Received: by 2002:a05:7022:1703:b0:144:f0c6:ddac with SMTP id a92af1059eb24-1a3c53db509mr2547824c88.17.1793089350969;
        Tue, 27 Oct 2026 01:22:30 -0700 (PDT)
Received: from localhost.localdomain ([113.161.48.203])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm37314409c88.11.2026.10.27.01.22.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 01:22:30 -0700 (PDT)
From: Adrian Nguyen <thenguyen1024@gmail.com>
To: Fabricio Akio <fabricioakio@gmail.com>
Cc: Casey Connolly <casey.connolly@linaro.org>,
	Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Robin Snyders <robin@snyders.xyz>,
	David Heidelberg <david@ixit.cz>,
	Richard Acayan <mailingradian@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] power: supply: qcom_smbx: report charger state changes
Date: Tue, 27 Oct 2026 15:22:15 +0700
Message-ID: <20261027082215.70983-1-thenguyen1024@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003-qcom-smbx-chg-state-change-v1-0-fffaef446932@gmail.com>
References: <20261003-qcom-smbx-chg-state-change-v1-0-fffaef446932@gmail.com>
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

On Sat, 03 Oct 2026 16:45:20 -0300, Fabricio Akio wrote:
> qcom_smbx does not handle the charger's chg-state-change interrupt, so
> a charge completing is not notified and consumers can keep a stale
> status.

Tested on a Vsmart Active 1 (SDM660/PM660). Switching charge_behaviour
between inhibit-charge and auto now fires chg-state-change once per
switch, with a uevent carrying the new status. A charge_behaviour write
alone doesn't send one, so this is what lets userspace notice.

Tested-by: Adrian Nguyen <thenguyen1024@gmail.com> # Vsmart Active 1 (PM660)

(Test script and mail drafted with an LLM assistant.)
