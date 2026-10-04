Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B6F43BDC8
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Oct 2026 11:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791115152; cv=pass; b=dnHkFPxfuDMyey/U7WJ4Kw6bqzIr3QducAE17xUdx2dXU7pk31dRZ/oA8b9NyElN30/V7RVHi6XDO76UDCLu1Z0weFZ1SUlWneB/j0L2VoOpd8GfoA4MaX178qOWvn04G6y6C/KrReaIvZhMvaEK0pl6fA55ZtqrpQLERrhEJ1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791115152; c=relaxed/simple;
	bh=YvGJiLLSGEag8VAXDiCkjwNnc51Pcejq5U71ONdSTxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iLfbbR5R5WN0LKD7xSJE7PWPy0WkU9t/+lZ4eqmQF4Dz+j5E+4QrLqKfFIlbCpsLy2CALmJwYS1p53Uw8BS+vfXAvK6hQ1otC39t86r1YxZt6dHjfg2b+kqBYp7R3m9NoRiewU99uDrG6PfWl6DyNdbXCHN6EZw1u+6iY5AqPGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqMLGH3p; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqMLGH3p"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3d90ac37so692439e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 04:59:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791115149; cv=none;
        d=google.com; s=arc-20260327;
        b=VTRFeDDIlRFqufODsnjUGh/krccfg1GJeMG+8e+sZnv8SGvKyq6WHSi42UKF1wImUL
         26OS3nf80fm33qmzpuy3XyaoKJwxcRA8HQuPALoaB+v07oZF44pWWqkPK0/rX3cPxI7O
         22/q9pS6oRhnROlhAcD77BBN9ZRI2sQ44bxHWjomMtZuciqnOEG3rLfEUkVKtCMMhIBE
         vV+BA/+Kd7CODx9c8cZY921WTD6FWAbZOwWnNOHRq8gV/E5uSBZyxt5d7M4ENCUmM1m2
         rgbKagJp6090yuhTr++2feUr4zX8wA/xIWhtkBxI7z3bMv6NNtIRCcTwFuq02LM+hNEl
         ZeHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YvGJiLLSGEag8VAXDiCkjwNnc51Pcejq5U71ONdSTxw=;
        fh=Mdh5qRi7XoNcNnbjtTSXENdTK1AFFVtHIGDUtAZNIBY=;
        b=Qr5bhcchmBfMkwe1Fa8jMCF+eBzldyrmJ3hdEJ9EePJF+J/s9qprhK1tv8nLfQG5vg
         YQW9mgYZdsDERkdjZmVlUrHjFCCeNE8Bfs/4j3we+Ql2p2+XLGcDib03avTHF/lZIkPP
         b1Gmg2Krnd8T2FjAb+XpxXYQGRceUqpglkcTSFICx2ZQdUCI7Qq8WySbCpFd3u/KIgS4
         PddAPB4Bi9uhYOPQPtsHRtrAfWZV3Asl9bK4GbsckY+JzxJ6h3w89iIJC98+Dwi9Iwjx
         O/lU86a8dArusOqTaVnNd+iqkjF8Wn4S1eUTAn7r1ia2PrK+WRdqG73Mxwh/L46tlVev
         V+eA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791115149; x=1791719949; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YvGJiLLSGEag8VAXDiCkjwNnc51Pcejq5U71ONdSTxw=;
        b=VqMLGH3pwV5hY7J2/iWBbwzoGS6jiCnk7KAk6ke0Y5Pbrt6TuydcD9N4g2hrXLiZeH
         nfqcTfyvgbmZBqPRYMm1CrrLcaIfG7CkPST1xEi4FPj1oeTPUkYeJu/O5Zgm6sw7oHXO
         KF3o+/3OSdPKbPOmCaRirw+/mfU4t87U+nIUcSGRHpM/cToqQHKsl7Dkh6MsqYt89gEj
         RBMvD9gosXW83TSojA1gmJ+AUPGq2lQ4g+HWct0/fzC0fm9DXy7lE/t+n+Mq1xnDFZjr
         E0pWQZzloJ5S74WqosP0opk/LVMUy6mA9UQlPVnIIuZfghh0N4ByKelCKkoYTomRoR4/
         /ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791115149; x=1791719949;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YvGJiLLSGEag8VAXDiCkjwNnc51Pcejq5U71ONdSTxw=;
        b=titnEhmQwHQUyHjyk/2crChxehsCjf/3t9gxjifIWPIWZLOV1yQ0PS/tK6BrLIMx+1
         C/zY/t6sXYWWeD2+HORNDfkoTrk3JEoiMO3TxTcOt8UyCsdhvUSTEcYj43nMeDYsA1li
         yJBn6zEM2v7SmJJ0wiS6I7JgyzD5Ah78StrOUAu31qYeGA82d8r9MV965ajxJHm9N09D
         2lsJxFDJQX4xK76Ks+rp1e95hRMqwCaHhtZHZbY2uxiST5qjTibIYXu9oZT1Y+DIEWhD
         Nu8Lyhd3kMpIZm1vGSZbbfqQ77AhQXb3n1hKm4aETJHG7VrGprVgaW3rZiM7uSHCiYAT
         ML6A==
X-Forwarded-Encrypted: i=1; AKwUvBzMaFlZ9dJG/iuYREcU84a6NYGvG0WYvYsc7UYBCXKbxqYDQRoFeHb8fNsfLL2YzxU27mh4Lm565czDKtsL@vger.kernel.org
X-Gm-Message-State: AFq9FYL3XvNGZ8wBjY8px60nd8I3fNob6DB0PGGMghfZWYG8Mgo873cB
	ik9TiCXqhenngkdE/+HQ/EnPWW6V8gu3l9QiyLrED6j1xqZjhKUUaBtmqjlUFRVoRfAQ4TyFHFC
	mIRO1R/HjFz8UfVlKNafme0pyq3aWUrQ=
X-Gm-Gg: AYBFou2Qvg/T+GJfkZvx6495MxxVdi6IjpwR7qz3xyqjL4aJSOaUhs51pt/tyTJjagY
	5x94nPvK3nIYMpIPAwR1xO1GrowTrq+XlkwiYZiqX8IngYBNFKUZmXFT/Iz42vEVDUqfsNid5Y6
	MvXdEMQyabxPIiMw9AsdV04xwyXqdSdMHtMvhwIx0nFST24Gt7O9AWzl1grQJheIVJ/1eYJ2W/9
	e03XloUHEwsK5/A6ZuCLVG9QZRy42/F3OpwIkF37RWa/VuuPi3PByjcd2EvBFEMZKwT6LU8uXXj
	u2zKL36CrLalbFCBKNOpc3StNjXWSW6yy9y3hlHh7Oz+w9V1WkFKl2w0OA==
X-Received: by 2002:a05:6512:3c84:b0:5bc:b8d8:d766 with SMTP id
 2adb3069b0e04-5bcb8d8d985mr953656e87.16.1791115148823; Sun, 04 Oct 2026
 04:59:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-qcom-smbx-chg-state-change-v1-0-fffaef446932@gmail.com>
 <20261003-qcom-smbx-chg-state-change-v1-1-fffaef446932@gmail.com> <20261004-jovial-fancy-ammonite-f9fd1d@quoll>
In-Reply-To: <20261004-jovial-fancy-ammonite-f9fd1d@quoll>
From: Fabricio Akio <fabricioakio@gmail.com>
Date: Sun, 4 Oct 2026 08:58:31 -0300
X-Gm-Features: AclHuK8XfUMsTrUjezp37dJXnfrGVlkqDXrTvYsOblQTNjNZvnfYIKp_Sma2dwU
Message-ID: <CANxzQdE8tmPLweN+gfs4DdpFJXpL7ruiyk1cwNA41TL8NbefCQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: power: supply: qcom,pmi8998-charger: add chg-state-change
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Casey Connolly <casey.connolly@linaro.org>, Sebastian Reichel <sre@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Robin Snyders <robin@snyders.xyz>, 
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org, 
	Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 04, 2026 at 10:06:52AM +0200, Krzysztof Kozlowski wrote:
> On Sat, Oct 03, 2026 at 04:45:21PM -0300, Fabricio Akio wrote:
> > The charger raises an interrupt when its charging state changes. Allow
>
> Each of the ones mentioned in the binding?

Yes, both. PMI8998 and PM660 have it as interrupt 1 of the charger
peripheral at 0x1000, as the downstream msm-pmi8998.dtsi and
msm-pm660.dtsi describe.
