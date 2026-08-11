Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F99A42E018
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 09:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440687; cv=none; b=dIGtDU+ob8NCrl4tjnP6XuZD3xp8RRGQG4allS/L6KILeryGr/kBZwiSwEWPZoNzJExZJrsZ9qkL1Z0uNUPcCEn3pvyuss05gA9o8jtesxitTy8UN74op//Q4Q/zsCCJLiYhtXSuVuxYmTJmn/zMwCIS2oP37CiqVzoM86YFw6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440687; c=relaxed/simple;
	bh=8QXwmcpvLOgS2HJEcrVuGl3PSKJiGBxtH2I13j0yeZA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=iikAJiVjLFx/4cX9bLZwiwOXo/05SogZ09KPpcqo5tNrzd5IQrS5BNyNATlbBBc1CDxyrwedHb9hkfQe7uf/P7EZE3uFGxr8pcg9+slUdZmKjgFWvNwzE2jaQrFYOOIHGTmroaj7BBqKvHTjNd3X2ypVwzU2Inr9SCIZ3SjQ3Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyk18MWH; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyk18MWH"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d004f135b1so7378655ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 02:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786440685; x=1787045485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=24lOYUM9cZxkUEGLRg6JPIJ8J7Sm+k+/AF/RPaqeH9Q=;
        b=lyk18MWH3cpWuRrJa34S3ofIqp+Sfl4k2izTx9zDN4o0Tkx5V5kKXyAaUtxyKP7nf/
         KSZlWbU2ZcxU3Uy8AmbXgYuUn5aK6HLDqyKrJROXvzwzgxlaEOphmZyR6InS+5JKd1uL
         0mAyD2NfhFMEP8Jc/UdIh8LH0dcZwMIoI5vwFCjZW24bXZZ6znSVF6b8peNarhZ00Hng
         J3o21LzWuQfo0IZcF6FqG9zCSBl5Z2lCYz0Hk/IROCNaA9QdiouqkQfEwgtHLNl1OJ8m
         MjswBXSo45pACCZnkKE0DpHtOGexSZIvbZdBcHyg2PDBDUx7ao9nFLI0Vl4q/TGh7Gw4
         1aKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440685; x=1787045485;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=24lOYUM9cZxkUEGLRg6JPIJ8J7Sm+k+/AF/RPaqeH9Q=;
        b=VK5u5nX4Sv9xmXgQfks8gQQhvN5OGN3hwNqBqj5GIyHaTsTeYEmrGF1A89T4TOUB6A
         ZYOwQj8xt/AyLCTjh5CPC+HGmOvnksjSz6r7PtaCsQ50MdBX7N89sKnTPCOkhcTPwCr5
         Qpm+TSChJTDV/iRcFDYztmQ5LwaFuSMIniFITNrPOdQBtILMq3IjEBzhFI0wNTOa6TWo
         iF7aoinGzkWF86nfJGXasoo9enmEKXFtPzOFh2kdP9Xs3pY7CexdwFmGR91ZSQAvnrYJ
         4doX52YnBVYIrAf5rQ8W5pIRxEPMInxaQ4nyp7YW+7WRmoOwKMI3A2Y9RthfrmayMP/A
         AF1A==
X-Forwarded-Encrypted: i=1; AHgh+RolfWSh8F9TiE5+ad+d1CgkwYo1qYLBg7oQVE8LsjL2xYklaveJ+6vcaZRyiiohU2yeupGBXVjoILX8J820@vger.kernel.org
X-Gm-Message-State: AOJu0YwfZ1d6jqjfQ5snc+/0AGj1l82KDuErNc4zZglk5GBPCaBcnAIm
	mSqR2quwNmT0S073lCueLxcKpz0acADSE5QCyuD/mWJ6Zj48gffzFmIH
X-Gm-Gg: AR+sD13GiOFjkiZ4N43iH63XDSpMtXeNvKy/vPBZOrLe7CFBZRNLNiAJrP7hF2uXc6r
	qEITg1l1WLXpBrtKILJDhQstFJYI2ohUa6ocwoELhWCEqu2auWKuizggskuMnVbS0CMzAqOUrPk
	NGNK43DQDLNilRjW7hzmEMMeGWg3sGxC6y8loXiM7kldGVFAdQFmJlBJM65BUrURSFJ1Hd3hgt4
	hITTDEmCH5n/dNTwjg9313YJ0g6BAdHreUEwK9RS+dIBvS4PyRkndUIYxFODcpGVY1zN9UGw4RH
	gSchIxU3ioaWhcSCfy3YdNhTxBB/BkbvihEbrQM3JDQZIDTkYkFWOzO4jTojrypAclhs4nOE3yS
	2Dry5rRn9u41vpmjGQiRxCSC73LCBr01N1I1s6due1LYU/T/DgnrY7qSEnzqo0lCXKU45AY3610
	KcxnkrrcL6/RQvl4OMWkY0O40cOvHTcjXJi8Ai8TXBo+ThuvuMIDrElqy42IlA2FZl1z1a3ehtV
	JW9wHfjJx45AfQrmfbSMk+bUmXqQf/13UILSFd9Oh0=
X-Received: by 2002:a17:903:944:b0:2bf:9760:b94d with SMTP id d9443c01a7336-2d31792b495mr25426375ad.15.1786440684729;
        Tue, 11 Aug 2026 02:31:24 -0700 (PDT)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f3f33csm4781325ad.26.2026.08.11.02.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 02:31:24 -0700 (PDT)
Message-ID: <73033a32-4efe-4ed2-9319-ffb205d28719@gmail.com>
Date: Tue, 11 Aug 2026 02:31:22 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: devnull+guptarud.gmail.com@kernel.org
Cc: andersson@kernel.org, broonie@kernel.org, conor+dt@kernel.org,
 conor.dooley@microchip.com, david@ixit.cz, devicetree@vger.kernel.org,
 guptarud@gmail.com, konrad.dybcio@oss.qualcomm.com, konradybcio@kernel.org,
 krzk+dt@kernel.org, lee@kernel.org, lgirdwood@gmail.com, linusw@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, pavel@kernel.org, phone-devel@vger.kernel.org,
 robh@kernel.org
References: <20260527-expressatt_camera_flash-v6-0-de0f150024e4@gmail.com>
Subject: Re: [PATCH v6 0/3] Samsung Expressatt: Camera Flash
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <20260527-expressatt_camera_flash-v6-0-de0f150024e4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,


https://lore.kernel.org/all/20260527-expressatt_camera_flash-v6-0-de0f150024e4@gmail.com/#t

This series seems to have fallen in between the cracks. Should I resend 
this patch series?


Thanks,

Rudraksha

