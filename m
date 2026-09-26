Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com [74.125.230.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF133EEAEA
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 12:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790424395; cv=none; b=Cne4EVV/Ih1IwKIfjsW5FDu1PKQy5EdmkuX/sUYgJcEdsMGzHZnIAO32BCZtkyqJdWWoyWkOkVex33vskr100pSh7CZfaDbWuxEX5+/6eFwEWYX6ccuSmH85nkT/Q2C/+rRQUxg7yRZgzTOoMZONJAiRkBeslSn4YtV8vRxC/AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790424395; c=relaxed/simple;
	bh=CH4Prtq0c/7ze11i5Sq86XT/bKlln4TK5tWRhirwDq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eFoSmH8/nhTnIRYzQClITMGBbx0zJOdiFXNwVAfyYqwpnTP5uAb2DQJrrOQctrUFrtvCZnbkaf148iW9NJaFtJksNbuK7PGJ76ISAv1fAekjnibjUTW9+Wyt/PtIAmpW9Sjqda2nTzly1YwRbMD3LqHhr+4FTfmzTJzKVtfnMQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=UfTg07ox; arc=none smtp.client-ip=74.125.230.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="UfTg07ox"
Received: by mail-qk2-f39.google.com with SMTP id d75a77b69052e-5332bdd8296so4737121cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 05:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790424393; x=1791029193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CH4Prtq0c/7ze11i5Sq86XT/bKlln4TK5tWRhirwDq4=;
        b=UfTg07oxKs0svAvereKcUHzppvRcGBfglBZYIb/htceKdk/jDDHxHEU555xai4O8cN
         4HWobDy10KJGPUw7lcEaScl372RPTQR17ecwZxl83eNCknvvqeImJE6EI8cFlGyBgBdS
         F79PPOkOWbDWEjJDJnNYV+SVrFvB8GPemQar0vzO+O9zTDovsSOVxuIV6/JoOkGNTVl4
         JaspCDGvAD1G+fxPaDMg/xyEK2ARPskF3qbt3xkOAWr8wyfieD0rW0qRCuaLl91c6GgQ
         v1/s/pbxltOhebcxRiBUeVMXP7J5U9An/cdJKwnirQtCavxkwXEGH7j0YHrsAj+rSYDG
         aOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790424393; x=1791029193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CH4Prtq0c/7ze11i5Sq86XT/bKlln4TK5tWRhirwDq4=;
        b=P4aO5MKUPv1PfRjuZ7lgQgpFDN5cYowu1DoriQOvQlBLUAWegeJaIQrPcMc4peDTv7
         wkb3BAYpv9EVLCJdLBDpQm+eNvBNLEWMKi6FS6ipN2zUC6InW2MH+eMjLjEc7dRDEurS
         s+Kz71CrdHZLzfPDNCW+5Y/Xp5CVXaIMppsAjeTcc55gICyO1c2k1xsbCJVpma/TOi9s
         TQ0A49LS4lKZgAY0Y73C6gIKG568uTvPhMsPIwLYzD4MUe5buSchNXTWE4IEQFw/e3bq
         RV2js0NZIHniBrmGrIcqJadZhrQRxvMIJoaG3ydD2wQ/pb9WNPZ/LVpUnMFHblCtJ0sn
         ccQw==
X-Forwarded-Encrypted: i=1; AKwUvBy1aC6aiTw/rj0mYtclKBA4PFUzkVKrjHomBHNrMLxIvEPVP8S4JSyk6HnDLgmdA//yABnZKBG3w0KL+/zf@vger.kernel.org
X-Gm-Message-State: AFuF++nAJngZ+9Gh3stjI568LO5vWxAgI0+WIKUa3m8EAxssdAgJXvOf
	GihSXhr4/GPjdcev81VEzbbf/TuOY409EohQTTagU2zqAlwKmq13jdoM7jOvjy0Ka6Y=
X-Gm-Gg: AYBFou1mlUWtj1LyzFZk977SVLgR6jhWktZN9xMJMhDdJBnsVKTWrgYDBjBPs8PlhRq
	1bgOHqvvCJH0l6vCMBU7+0WkmqCj0trRLR6WcFu3ODIYhDTw/gdLXspWjU1fRG6GJyWKw0NcfBH
	KMrkWBC1n4bPKcbO2hKDP6EEp7l+Ej2OxUBf9sZ3Fispso+n+AlLCwAYIh3Qw1fH5XQNLgcwPj3
	2uuEchc9sw3rD9em+yoQAfv5Rp7sLQyKUSJseO646VIRj9eazLia5bGtxRiGCpssgBXSUWmtLlm
	dmY7e89v/nhoDqw1BKF4J1hFqlMSeAUmZXBqtPMG3bN3e2hYRnIbvwKzKG/6nomq2sZo5XZowLA
	87J1HOx8fzKuyUJdJRoXBvwEnIgbWvGjKykQmJqLS8SFpKWnIS6WfgnCKKr+OKGW5ifKSEeFGPP
	9XQulrhCKsGNwA8iGcrrZv8xJFILJQOrjcHWc3enhkkjgPo1Kd1Rv8PjwuhA==
X-Received: by 2002:a05:622a:8cd:b0:530:d0c0:3ce1 with SMTP id d75a77b69052e-5330b5cabaemr99774151cf.21.1790424392756;
        Sat, 26 Sep 2026 05:06:32 -0700 (PDT)
Received: from armok ([2605:a601:a61d:7a00::2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5332225a696sm16438811cf.14.2026.09.26.05.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 05:06:32 -0700 (PDT)
From: Liviu Nicoara <lnicoara@thinkoid.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: add the front camera
Date: Sat, 26 Sep 2026 08:06:26 -0400
Message-ID: <20260926120626.26514-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <qmc4prmummwwwel4zukqh5fy6jy2f6qke3ygdnv6a7ygvsowkq@gtmznsipiyhb>
References: <qmc4prmummwwwel4zukqh5fy6jy2f6qke3ygdnv6a7ygvsowkq@gtmznsipiyhb>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 26 Sep 2026 13:17:34 +0300, Abel Vesa wrote:
> On 26-09-25 14:10:24, Liviu Nicoara wrote:
> > Depends on the x1e80100 camera DT series (v7), and on the CAMSS PHY API
> > patches (v20 5/6 and 6/6), which read the CAMSS endpoint's data-lanes
> > as 1-based.
>
> This shouldn't be part of the commit message. Drop it.

Will do in v2; it will stay below the --- line only.

> At some point, there was a patch from Laurentiu Tudor, but I cannot find
> that patch on the mailing list, so I guess you sent it first.

I have not seen it; the wiring here came from the Windows driver
store, as in the message. I could not find it on the list either.

Thanks for the review,
Liviu
