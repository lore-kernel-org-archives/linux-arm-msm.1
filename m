Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793084924;
	b=mvKj178OqoXIx6FDP1eQu0Ew2Tbnn13/ePoZZjAEw9tkMCTxlVUvTsBtAvnUkvkChHTl
	 U3p/mVZN0KHb0rbJFbhnaDRa0WVQ3r1CNKf9UsmLk1HDunhUdEQN7jlOB0q7FgPQGn6uS
	 peDkwfy50YE5p1bXYALbf8+qudyBwCRF6De9iv2uRTpi/MokD2HKsYGhVY+AVf/l1tqvg
	 b9iniUFFCAzrU6dskW5mLoB5o/S6Y5ufueM8xML1CFsP61fCmctJLt3CY3NLhNU2Kz28D
	 1esidsnaRb0NbtX2ZZp/mhwLqpZEPAYwVyoJGrcCKn+2K6PzcCjhwNu6dz0pr/NVkSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793084924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=6zazjVTQz3Lc+/QZ9WoAd0ReZCneFGPIxm+AtvJf/J4=;
	b=fFvfdGD0jliXiiTePfPs5yQOD14W/0Mhj49B6jo3b5RxDV+kvsS7aK874ecVXW+7nUsd
	 yfd/8/oe9mUINpTXOgk0EKNc+JKl8jW9ua7Ocd6FH2Q7I6HkaQ3OhoXF7tY6WLW4E4uZt
	 oDjq0Qq9G91TvTvp29KsTEfX775Cqo4dSei6lLzzY5X2+uZ99AWH1x++YitKJMx4MmAyV
	 jbfxblMJq+oCKRDpOGl/IxvgKWM5lcz3AvVy2hRHkH7jwUFvBfoB0NZD7sH/mMoivTeuf
	 OyKA2kCI9hgzuaZPjqkE12a/j2gzpNKIUxTGN/afhJxFkDnu6a7uW3rm8G92J3udflQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AdLINEE9;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98827606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 07:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98827606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AdLINEE9
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so3107725a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 00:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793084923; x=1793689723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6zazjVTQz3Lc+/QZ9WoAd0ReZCneFGPIxm+AtvJf/J4=;
        b=AdLINEE9Xgb7dNR1swD4xNFfCwJlS7Byu/htEqNWINHagScw1+K+Em34GSDuOmP9yz
         ZihG0AtYGAemaE5lGfAhfTaFgzlIBvNwwN8HsiHQ/hQXH8i0tFls5Z5pZAgSAMgOYgXD
         gLo7ssEfGW051qHJYkQEzSIVSiLTiLop8v4pvOrw5mprIYAgtWWqZ0o8HQyrk0thsej3
         nDIIiRMCc8tyCsmRCM0qqWIOaxKh5Ejv2jxi4jsQCIE5quU0n3nb9UihefYhjwNKSN9L
         FiF3ngKZUrLk+dZhhM+4zOKkXkH1S14OLPJTWeiE36tZ5cpjGmXwfx3gWpzHamR6sLHT
         C1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793084923; x=1793689723;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zazjVTQz3Lc+/QZ9WoAd0ReZCneFGPIxm+AtvJf/J4=;
        b=27b9E0l5oJqZfPmjZnpLSoUCNSX64UOfzm8LNX0KcsVubFcI3uXCeTBCpWLuEGhjwF
         LyNd65EXY+kjNTEPWEjBYdJtRzZJzzSpgWWSvTwajCgJLSZmK2NqHCn6CeL0FUzI+eAu
         XMgE7duegSxJkvN6K6oh/hfQzsxCwzROaxouoffWsTpI5eXp02xSmLXFtk7kNrMrdZBL
         7Sr/o3NIhZ52k3fbITDxXNCjCtyaVJ9C7qDnAzdVgqkE+4aoq/fCHy7mA9PCMiu9OWbw
         ywWSkifSifcCRbLyFf7EmPAFzwmv49UCi2vlj6aNW8eMZzX+MrrtjqCSmVJD3Tp1+7+f
         2TIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBTKlNF5mzLHRSLgAU0qRjaJxzNM10DbKMWdbtsRCGoZ3to79tLqwJq/nmwK86/iROoufZ8hi9bDd7qMFV@vger.kernel.org
X-Gm-Message-State: AFq9FYIkEUneWLwehfIy9SM9Hzt+SUdRR9EPJdWa+OBYvJ/7NgWhuuLn
	LWmlqK7dqme9vmA2YcPkZyp2RVj8wZ5fu5WlvEZszxvDyf4IEt+VXWk=
X-Gm-Gg: AYBFou1+x5bchn+IVr7E2U22TZhXYFt3R1uiZWH8VVMN1seu7voF6kpYHzmfMKfeaiU
	s3Y7uJFPhW6HbSDSXs4dGw43McmFPrTQ1eOcXVKgAok8j4SlK/WQcqtRHk6ZySpJGtsM1X72+H/
	doG8TqsiQRhsRfRpzSqTynMzSpBEPmz1aTKvaAtWBTtGi4BcO2RdDWbpiAJ4mf9XDjjLBHYUVHq
	4QDVSiwp+xwJrPhRfeFh9T5CG3AgC8iVQDR0mFgQrqKf/LYUYESKyETw7BTzEf0UknHvNTOCupE
	9wSiq8ZHoe3ov1N2/DFVoF6N8YXBzFshhwQvPrR0ajE47Rt21FXL6/LEqrXTnHrUc5oaGjlPDDZ
	oaA2ew1/FSirUHLem96inLoLu1z9n8pEct8C/OeaOouuI1zO7qB4NSgekxHpdvxbHrJflrH7dnP
	j5yzk8ojCtmbwSZ0sGADcGYT458vrd7hxJ43zlJG4KHGf5moIxBu7H4xYSiGAaU3vm2t3KmZjNJ
	RiTa428Ro3bmcaTJNn1xX70xWGKU9ZiRNtumXtCD6/nV8hPx8dNnRKeFPTqlarEOTnwN0d7XInp
	X6O7JvDmrZ2dBof0MEUFXBs6OEu3X62ngXI=
X-Received: by 2002:a17:90b:3941:b0:3ac:eeb:e0ed with SMTP id 98e67ed59e1d1-3adead5e324mr7265729a91.36.1793084922903;
        Tue, 27 Oct 2026 00:08:42 -0700 (PDT)
Received: from [10.1.1.198] ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae401bf352sm2540119a91.0.2026.10.27.00.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 00:08:42 -0700 (PDT)
Message-ID: <4934834b-41ab-4663-b031-d04d736e9fe8@gmail.com>
Date: Tue, 27 Oct 2026 00:08:41 -0700
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: phy: qcom: qmp-combo: Glymur USB Gen2 fails on one port (chip rev
 2.0)
From: Burke Cates <burke.cates@gmail.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
 Nabige Aala <nabige.aala@oss.qualcomm.com>,
 Mahadevan P <mahadevan.p@oss.qualcomm.com>, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <5b31ea48-7918-4f0b-b012-6915b384b922@gmail.com>
Content-Language: en-US
In-Reply-To: <5b31ea48-7918-4f0b-b012-6915b384b922@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/10/2026 23:40, Burke Cates wrote:
> These tests used v7.3-rc5 with out-of-tree Glymur platform/board
> patches, including DP PHY support. They were not on an unmodified
> mainline kernel.

The end of my message was cut off when I pasted it. It should have
continued:

AI coding assistants helped with the bring-up and this report. The
logs and test results above are from the recorded hardware tests.

Thanks,
Burke
