Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97AC3BE635
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993083; cv=none; b=XRJp7S8vPUpXFr0Rd6eZlad7EXL7QWgqAQaqpXbvedjN/Hbl7K3pWH1SHwxx/MX7vzGfkjibgQD/ncdv8XDZhSo91i/xjhcrL5p/MABND9XKZO1OOgkHDI/yrHo+cQXLkmlW+pmOoBPnsjEHUvbrhMNiG6fmY0HKaei4FgdfrJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993083; c=relaxed/simple;
	bh=UZGB3K2JcnX4lOV4vLAtC2gzRNE80zgmQkUEh7WGGpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GNXd1raRO8AdzbtMRCh7beU3NiKB00yidwEv4H1UPhr5bOvnWjAedYEJFvOr/uCSNhxIU2tIukS4S4NeDS52ql2n+1t7ONs1w52cq/0ul/S+8PLFUigv5t4ZKHieRvG8R+WlU6jstUNxpZflf1CkTS6W0t8s55s82Lp9kW97P4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZTrJO0+; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZTrJO0+"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a1a631f6aso330628066b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789993080; x=1790597880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UZGB3K2JcnX4lOV4vLAtC2gzRNE80zgmQkUEh7WGGpE=;
        b=jZTrJO0+fauueQL9TtT4/Dld7m7bmK/cJxXkmA074KiULrS3+IxFCCDiYYlTfZYmBT
         cinvcICsh00cYtoOtnQemcRz48VN9p2FR0RENoahW2eH/YUpOcTvJrFdkRdF+N5p4tAx
         UiGnRXQtZb/hDRFuVEUWm5PJe7Ovplz1UhV0MDs/x3EKliRd+ocR66FsIeR/mEq08iUp
         YBAXpdlHNagZPHD7NcGjllYzVwMZfGJ3O8rIoP2zOWizj3xNpGAdhh2m4Jr3IXzyxPXf
         jz359vv/07t8ddYVbSAz0sjFhhLSYwymm/ckMlBICvRchhlOuGGu1edgGUj5wxj1NcIR
         cb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993080; x=1790597880;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UZGB3K2JcnX4lOV4vLAtC2gzRNE80zgmQkUEh7WGGpE=;
        b=PM/97TLw0vO2+Ole2gN0oVSGD6u0ouklm1PUJM9lvsYoHAFXll7Kl/A8rM7ycb/OAm
         J4UsvemuTP1X1W+9ODc5MISwvXKeFejxOkfcd2d+FicPu73+cgdxhCLFES9+VHD91BxH
         5OUgCrPwZ2o8yaaRyVoRiuS6jWV5iOuhm6srpnlWdkC0I7Rw6qP/OF0Ibmh7d1wAVjmZ
         UI8vwRdXaTRvz0OOCDnfc+TDh2Qeh/JW+gmyUzZBlFMRqp/6fHIEAt8GxBdDJ7RRU4ad
         kFqO080mweia9rP+3oYQAgYp3DfFlv7cPvCW+cK0suhz1JBdqajEC2j5NjOMGcNTr575
         035Q==
X-Gm-Message-State: AFuF++lzJXR59g3+07Di5VPjoN7qt+ncpjS6YM3u6iSQB4TgfdPn0cZ9
	2ZD79ygnkQ2NnIGIIGT9Dy/hlLRFU4SVXqIOackYbbRplKi/vWCyUQa0
X-Gm-Gg: AYBFou1/9SihM02/7+5JggzC6KxemSJOzom5sdMg++aAXikjv8G0JwJ+SckoLQwf9FY
	CiQYhZYstgAwTqidHfLH5e/gDQcKdh5RC9Znv8/fXMRvptc//ofNusOQV3Kfa+U2g7O4VQ95U7o
	hQT59Ik9oIRx8+YQ96GOeGAyjgn9XB1OtBJQ4GUy2DRjM2eapos4GFRekaWHsc49mw1miUsalN6
	7yVVURm6iBk3hUgi6MekqY8TylpBSYQTwSVe6XVrotJK4z/TYJT5FeMR7ryCK+48RE8/BJIY9Tk
	bxD6qzt0HcZAUrds3/XYJh1hikA3pxkN0wjbAg8UVFeTTkTMoRaI2LWIIIWmFBiTA8Ln0hqYOyS
	QfTQeLSKX5kwkRcANnbPhU1jc/gTpjo19S8BQFkVRm0v12mePlwqQ17ahgLqwtj/LEw9NYwKb3r
	3Xp8faHaDvQm7/9OvKmZ6a9ccn0l0BewUkS/Rw1sZUX7OrhnQ95ZljLn19PU/pK9r/3LUoPJ4DJ
	nmAJaOH/A==
X-Received: by 2002:a17:907:9484:b0:c25:c7a9:7b8a with SMTP id a640c23a62f3a-c2a156d4a6dmr916170866b.12.1789993079677;
        Mon, 21 Sep 2026 05:17:59 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm308205866b.63.2026.09.21.05.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:17:59 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the embedded controller
Date: Mon, 21 Sep 2026 14:17:51 +0200
Message-ID: <178999307097.27086.2572116331075139440@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <165d1eb4-f5e7-4f54-9f9c-22a210976d71@oss.qualcomm.com>
References: <165d1eb4-f5e7-4f54-9f9c-22a210976d71@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Konrad,

On Mon, Sep 21, 2026, Konrad Dybcio wrote:
> No, merging a node without dt-bindings would cause DT validation errors
> (which you can check via make dtbs_check / make CHECK_DTBS=1 qcom/foo.dtb)

Got it. Please drop this patch. It will come back as the last patch of
the EC driver series.

Thanks,
Oleg
